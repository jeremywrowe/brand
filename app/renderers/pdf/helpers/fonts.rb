# frozen_string_literal: true

module Pdf
  module Helpers
    module Fonts
      FONT_BASE_PATH = Rails.root.join('vendor', 'assets', 'fonts').freeze
      FONTS = {
        'Devicon' => { normal: File.join(FONT_BASE_PATH, 'devicon.ttf') },
        'Fa' => { normal: File.join(FONT_BASE_PATH, 'fa-regular.ttf') },
        'FaBrands' => { normal: File.join(FONT_BASE_PATH, 'fa-brands.ttf') },
        'OpenSans' => {
          normal: File.join(FONT_BASE_PATH, 'OpenSans-Regular.ttf'),
          bold: File.join(FONT_BASE_PATH, 'OpenSans-Bold.ttf')
        }
      }.freeze

      def setup_fonts
        font_families.update(FONTS)
        font(:OpenSans)
      end
    end
  end
end
