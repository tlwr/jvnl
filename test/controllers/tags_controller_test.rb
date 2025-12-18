 require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    get tags_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)

    get new_tag_url
    assert_response :success
  end

  test "should create tag" do
    sign_in users(:one)

    assert_difference("Tag.count") do
      post tags_url, params: { tag: { id: "test-tag" } }
    end

    assert_redirected_to tags_url
  end

  test "should destroy tag" do
    sign_in users(:one)

    tag = Tag.create!(id: "test-tag")
    assert_difference("Tag.count", -1) do
      delete tag_url(tag)
    end

    assert_redirected_to tags_url
  end
end
