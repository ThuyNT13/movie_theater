require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  # Allow to test for logged_in user as helper methods aren't available in tests, so current_user is unavailable
  # use session to establish this
  def is_logged_in?
    !session[:user_id].nil?
  end
end
