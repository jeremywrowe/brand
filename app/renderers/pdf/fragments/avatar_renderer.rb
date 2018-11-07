require 'prawn'

module Pdf
  module Fragments
    module AvatarRenderer
      include Prawn::View
      include ::Pdf::Helpers::Image
      AVATAR_OUTLINE_COLOR = '209CEE'.freeze

      def render_avatar(avatar)
        avatar_image = download_image(url: avatar.url)
        grid([0, 0], [2, 2]).bounding_box do
          if avatar_image
            save_graphics_state do
              image_width = bounds.width - 150
              fill_color AVATAR_OUTLINE_COLOR
              fill_circle [image_width / 2, bounds.height - image_width / 2], 3 + image_width / 2
              soft_mask do
                fill_color 0, 0, 0, 0
                fill_circle [image_width / 2, bounds.height - image_width / 2], image_width / 2
              end
              image avatar_image, width: image_width, height: image_width
            end
          end
        end

        grid([0.5, 1.3], [2, 2]).bounding_box do
          text avatar.name, style: :bold
          avatar.blurbs.each do |blurb|
            text blurb
          end
        end
      end
    end
  end
end
