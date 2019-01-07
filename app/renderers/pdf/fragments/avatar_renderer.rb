# frozen_string_literal: true

require 'prawn'

module Pdf
  module Fragments
    module AvatarRenderer
      include Prawn::View
      include ::Pdf::Helpers::Image
      AVATAR_OUTLINE_COLOR = '209CEE'

      def render_avatar(avatar)
        conditionally_download_and_render_avatar_image(avatar)
        render_avatar_blurb(avatar)
      end

      private

      def conditionally_download_and_render_avatar_image(avatar)
        avatar_image = download_image(url: avatar.url)
        return unless avatar_image

        grid([0, 0], [2, 2]).bounding_box do
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

      def render_avatar_blurb(avatar)
        grid([0.1, 1.15], [2, 2]).bounding_box do
          text avatar.name, style: :bold
          avatar.blurbs.each do |blurb|
            text blurb, size: 8
          end
        end
      end
    end
  end
end
