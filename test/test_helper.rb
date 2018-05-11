ENV['RAILS_ENV'] ||= 'test'
require 'minitest/pride'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
end
