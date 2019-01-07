# frozen_string_literal: true

require 'application_system_test_case'

class VisitingTheHomePagesTest < ApplicationSystemTestCase
  test 'When a user visits the home page, they can see my github contributions' do
    visit root_url

    assert_selector 'h2', text: /[\d|,]+ contributions in the last year/
  end
end
