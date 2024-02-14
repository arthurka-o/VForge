require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "Registering new User" do
    visit new_user_path
    assert_selector "h1", text: "New User"

    fill_in "Name", with: "Test User"
    click_on "Sign Up"

    assert_selector "h1", text: "Home Page"
  end

  test "Showing User profile" do
    # TODO
  end

  test "Update User data" do
    # TODO
  end
end
