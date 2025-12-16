require "application_system_test_case"

class PicturesCrudTest < ApplicationSystemTestCase
  test "create, show, edit, and destroy a picture" do
    # Create user
    user = User.create!(email: "test@example.com", password: "password")

    # Initially no pictures
    visit pictures_path
    assert_text "Er zijn geen beelden"

    # Login
    visit "/inloggen"
    fill_in "E-mail", with: "test@example.com"
    fill_in "Wachtwoord", with: "password"
    click_button "Inloggen"

    # Create picture
    click_link "uploaden"
    fill_in "Titel", with: "Test Picture"
    fill_in "Beschrijving", with: "A test image"
    attach_file "Afbeelding", Rails.root.join("test/fixtures/files/test_image.svg")
    click_button "Uploaden"

    assert_current_path %r{/pictures/\d+}
    assert_text "Afbeelding geüpload"

    # Check picture is listed
    assert_current_path %r{/pictures/\d+}
    assert_text "Test Picture"
    assert_text "A test image"

    # Edit
    click_link "Bewerken"
    fill_in "Titel", with: "Updated Picture"
    fill_in "Beschrijving", with: "Updated description"
    click_button "Bijwerken"

    # Back to show
    assert_text "Updated Picture"
    assert_text "Updated description"

    # Destroy
    click_link "Bewerken" # back to edit
    click_button "Verwijderen"

    # Back to index, no pictures
    assert_current_path pictures_path
    assert_text "Er zijn geen beelden"
  end
end
