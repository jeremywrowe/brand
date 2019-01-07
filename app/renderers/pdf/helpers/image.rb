# frozen_string_literal: true

require 'open-uri'
require 'timeout'

module Pdf
  module Helpers
    module Image
      def download_image(url:)
        return false if url.blank?

        Timeout.timeout(30) { open(url) }
      rescue Timeout::Error
        false
      end
    end
  end
end
