require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase
  test '#duration - defaults to "present" when no end date is provided' do
    experience = Experience.new('', '', ['August 2020'], [], '')
    experience_with_blank = Experience.new('', '', ['August 2020'], [' '], '')

    assert_equal ['August 2020 - Present'], experience.durations
    assert_equal ['August 2020 - Present'], experience_with_blank.durations
  end

  test '#durations - uses both start and end date when provided' do
    experience = Experience.new('', '', ['August 2020'], ['March 2222'], '')

    assert_equal ['August 2020 - March 2222'], experience.durations
  end
end
