require 'test_helper'

class ResumeContentTest < ActiveSupport::TestCase
  test '#experiences - converts experience entries from yaml into Experience objects' do
    experiences = ResumeContent.new.experiences.map(&:class)

    assert experiences.all? { |klass| klass == Experience }
  end

  test '#avatar - converts the avatar entry from yaml into an Avatar object' do
    assert_equal Avatar, ResumeContent.new.avatar.class
  end

  test '#contact_locations - converts contact contact location entries from yaml into ContactLocation objects' do
    contact_locations = ResumeContent.new.contact_locations.map(&:class)

    assert contact_locations.all? { |klass| klass == ContactLocation }
  end
end
