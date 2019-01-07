# frozen_string_literal: true

require 'test_helper'

module Pdf
  class ResumeTest < ActiveSupport::TestCase
    setup do
      @resume = Pdf::Resume.new(ResumeContent.new)
      @inspector = PDF::Inspector::Page.analyze(@resume.render)
      @contents = Array(@inspector.pages.first&.fetch(:strings))
    end

    def test_render_page_count
      assert_equal @inspector.pages.count, 1, 'Should have had one page for the pdf and did not'
    end

    def test_render_companies
      ['Citrix', 'Chargify', 'Mutually Human Software', 'Blue Medora, LLC'].each do |company|
        assert_includes @contents, company, "Did not include #{company} company in contents"
      end
    end

    def test_render_descriptions
      ['At Citrix I have maintained', 'I developed and maintained', 'Mutually Human Software is', 'Blue Medora is'].each do |description|
        assert_includes_match(@contents, description)
      end
    end

    def test_render_file
      assert_nothing_raised { @resume.render_file(Rails.root.join('tmp', 'test-output.pdf')) }
    end

    private

    def assert_includes_match(contents, pattern)
      matching_entry = contents.detect { |entry| entry =~ /#{pattern}/ }
      assert matching_entry.present?, "Did not find '#{pattern}' in #{contents.inspect}"
    end
  end
end
