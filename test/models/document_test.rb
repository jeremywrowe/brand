require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test '#experiences - converts experience entries from yaml into Experience objects' do
    experiences = Document.new.experiences.map(&:class)

    assert experiences.all? { |klass| klass == Experience }
  end

  test '#avatar - converts the avatar entry from yaml into an Avatar object' do
    assert_equal Avatar, Document.new.avatar.class
  end

  test '#contact_locations - converts contact contact location entries from yaml into ContactLocation objects' do
    contact_locations = Document.new.contact_locations.map(&:class)

    assert contact_locations.all? { |klass| klass == ContactLocation }
  end
end
