require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test '#experiences - converts experience entries from the yaml document into Experience objects' do
    experiences = Document.new.experiences.map(&:class)

    assert experiences.all? { |klass| klass == Experience }
  end
end
