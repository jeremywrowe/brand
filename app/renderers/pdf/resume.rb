require 'prawn'
require 'prawn/table'

require_relative 'fragments/avatar_renderer'

ICONS = {
  'fas fa-at' => "\uf0e0",
  'fab fa-github' => "\uf09b",
  'fab fa-linkedin' => "\uf08c",
  'fab fa-twitter' => "\uf099"
}

module Pdf
  class Resume
    include ::Prawn::View
    include ::Pdf::Helpers::Fonts
    include ::Pdf::Fragments::AvatarRenderer

    def initialize(resume_content)
      @resume_content = resume_content
    end

    def render
      generate_content
      document.render
    end

    def render_file(path)
      generate_content
      document.render_file(path)
    end

    private

    def generate_content
      setup_fonts

      repeat(:all) do
        draw_text 'Generated by https://github.com/jeremywrowe/brand', at: [0, -15], size: 8
      end

      define_grid(columns: 7, rows: 16, gutter: 1)

      render_avatar(@resume_content.avatar)

      email_contact = @resume_content.contact_locations.select(&:email?).first
      contact_locations = @resume_content.contact_locations.reject(&:email?)
      service_offset = 3

      if email_contact
        grid([0.5, service_offset], [0.5, service_offset]).bounding_box do
          render_icon(email_contact, :Fa)
        end
        service_offset += 1
      end

      contact_locations.each_with_index do |contact, index|
        offset = index + service_offset
        grid([0.5, offset], [0.5, offset]).bounding_box do
          render_icon(contact, :FaBrands)
        end
      end

      move_down 60
      text @resume_content.bio, size: 8

      move_down 40
      text 'Experience', size: 10, style: :bold
      move_down 10

      experiences = @resume_content.experiences
      data = experiences.map { |ex| [make_table([[ex.company], [ex.title], [ex.duration]], cell_style: { border_widths: 0,  size: 8 }), ex.description] }
      table([['Info', 'Description'], *data], header: true, row_colors: ['F5F5F5', 'FFFFFF']) do
        cells.borders = []
        style row(0), size: 8, font_style: :bold
        style rows(0..-1), padding_bottom: 10, padding_top: 10
        style rows(1..-1), size: 8
        style column(0), padding_left: 0
        style column(-1), padding_right: 0
      end
    end

    def render_icon(contact, font_face)
      text contact.heading, align: :center, size: 8
      font(font_face) do
        text(
          "<link href='#{contact.link}'>#{ICONS[contact.icon]}</link>",
          size: 30,
          inline_format: true,
          color: '3273DC',
          align: :center
        )
      end
    end
  end
end
