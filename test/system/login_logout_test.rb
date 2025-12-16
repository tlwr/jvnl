require "application_system_test_case"

class LoginLogoutTest < ApplicationSystemTestCase
  test "login and logout" do
    user = User.create!(email: "test@example.com", password: "password")

    visit "/inloggen"

    fill_in "E-mail", with: "test@example.com"
    fill_in "Wachtwoord", with: "password"
    check "Onthoud mij" # optional

    click_button "Inloggen"

    # Check logged in: logout button appears
    assert_selector "button", text: "uitloggen"

    # Click logout
    click_button "uitloggen"

    # Check logged out: back to login page and logout button is gone
    assert_current_path "/inloggen"
    assert_no_selector "button", text: "uitloggen"
  end
end
