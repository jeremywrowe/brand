# frozen_string_literal: true

require Rails.root.join('lib', 'devicon')
require 'prawn'

module Pdf
  module Fragments
    module TechnologyRenderer
      include Prawn::View
      MAPPING = Devicon.parse.freeze

      def render_technology
        stroke do
          font(:Devicon, color: 'red') do
            start = 56
            MAPPING.keys.each do |key|
              start += 1
              unless MAPPING[key].nil?
                puts MAPPING[key], key
                text_box MAPPING[key], at: [start, 48], size: 50
              end
            end
          end
          rounded_rectangle [50, 50], 20, 10, 2
        end
      end
    end
  end
end
