require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase
  test '#duration - defaults to "present" when no end date is provided' do
    experience = Experience.new('', '', 'August 2020', '', '')

    assert_equal 'August 2020 - Present', experience.duration
  end

  test '#duration - uses both start and end date when provided' do
    experience = Experience.new('', '', 'August 2020', 'March 2222', '')

    assert_equal 'August 2020 - March 2222', experience.duration
  end
end
