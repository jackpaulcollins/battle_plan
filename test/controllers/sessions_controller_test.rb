require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def test_it_doesnt_create_a_session_without_all_arguments
    user = User.new(email: "test@test.com", password: "password123", password_confirmation: "password123")
    assert_not user.authenticate(password: "wrongpassword") 
  end

end
