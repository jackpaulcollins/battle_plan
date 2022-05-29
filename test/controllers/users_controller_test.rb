require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def test_it_doesnt_create_when_passwords_mismatch
    u = User.new(
            email: "test@test.com", 
            password: "!1Password",
            password_confirmation: "!1Wrongpasswordconfirmation"
            )

    assert_not u.save
    assert u.errors.full_messages.include?("Password confirmation doesn't match Password")
  end

  def test_password_needs_one_uppercase
    u = User.new(
          email: "test@test.com",
          password: "password123",
          password_confirmation: "password123"
        )
    assert_not u.save
    assert u.errors.full_messages.include?("Password must contain special character")
  end

  def test_password_needs_one_special_char
    u = User.new(
          email: "test@test.com",
          password: "Password123",
          password_confirmation: "Password123"
        )
    assert_not u.save
    u.save
    assert u.errors.full_messages.include?("Password must contain special character")
  end

  def test_password_needs_one_special_num
    u = User.new(
          email: "test@test.com",
          password: "Password!",
          password_confirmation: "Password!"
        )
    assert_not u.save
    u.save
    assert u.errors.full_messages.include?("Password must contain at least one number")
  end

  def test_it_works_when_all_validations_met
    u = User.new(
          email: "test@test.com",
          password: "Password1!",
          password_confirmation: "Password1!"
        )
    assert u.save
  end

end
