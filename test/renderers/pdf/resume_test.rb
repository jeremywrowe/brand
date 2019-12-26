# frozen_string_literal: true

require 'test_helper'

module Pdf
  class ResumeTest < ActiveSupport::TestCase
    setup do
      @resume = Pdf::Resume.new(ResumeContent.new)
      @inspector = PDF::Inspector::Page.analyze(@resume.render)
      @page_count = @inspector.pages.count
      @contents = Array(@inspector.pages.first(@page_count).flat_map { |page| page.fetch(:strings) } )
      @resume_yml = YAML.load_file(Rails.root.join("app", "data", "resume.yml"))
    end

    def test_render_page_count
      assert_equal @page_count, 2, 'Should have had two pages for the pdf and did not'
    end

    def test_render_companies
      @resume_yml["experiences"].map { |job| job["company"] }.each do |company|
        assert_includes @contents, company, "Did not include #{company} company in contents"
      end
    end

    def test_render_descriptions
      document_contents = @contents.join(" ")
      @resume_yml["experiences"].map { |job| job["description"] }.each do |description|
        assert_includes_match(document_contents.strip, description.strip)
      end
    end

    def test_render_file
      assert_nothing_raised { @resume.render_file(Rails.root.join('tmp', 'test-output.pdf')) }
    end

    private

    def assert_includes_match(contents, pattern)
      matching_entry = contents.include?(pattern)
      assert matching_entry.present?, "Did not find '#{pattern}' in #{contents.inspect}"
    end
  end
end
