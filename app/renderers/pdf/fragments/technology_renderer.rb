# frozen_string_literal: true

require 'prawn'

module Pdf
  module Fragments
    module TechnologyRenderer
      include Prawn::View
      include ::Pdf::Helpers::DeviconMapping

      def render_technologies(technologies)
        technologies.map do |technology|
          "<color rgb='#{technology.color}'><font name='Devicon'>#{technology.character}</font></color>  <font size='6' align='center'>#{technology.display}</font>"
        end.join('  ')
      end
    end
  end
end
