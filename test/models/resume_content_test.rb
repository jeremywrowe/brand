# frozen_string_literal: true

require 'test_helper'

class ResumeContentTest < ActiveSupport::TestCase
  test '#experiences - converts experience entries from yaml into Experience objects' do
    experiences = ResumeContent.new.experiences.map(&:class)
    all_expriences = experiences.all? { |klass| klass == Experience }

    assert all_expriences
  end

  test '#avatar - converts the avatar entry from yaml into an Avatar object' do
    assert_equal Avatar, ResumeContent.new.avatar.class
  end

  test '#contact_locations - converts contact contact location entries from yaml into ContactLocation objects' do
    contact_locations = ResumeContent.new.contact_locations.map(&:class)
    all_content_location = contact_locations.all? { |klass| klass == ContactLocation }

    assert all_content_location
  end
end
