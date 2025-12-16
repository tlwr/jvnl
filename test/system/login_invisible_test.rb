require "application_system_test_case"

class LoginInvisibleTest < ApplicationSystemTestCase
  test "no login button on index page when not logged in" do
    visit "/"

    assert_no_selector "button", text: "inloggen"
  end
end
