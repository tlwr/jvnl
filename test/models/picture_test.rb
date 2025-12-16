require "test_helper"

class PictureTest < ActiveSupport::TestCase
  test "requires image attachment" do
    picture = Picture.new(title: "Test Title", description: "Test Description")

    assert_not picture.valid?
    assert_includes picture.errors[:image], "can't be blank"
  end

  test "requires title" do
    picture = Picture.new(description: "Test Description")

    picture.title = ""
    assert_not picture.valid?
    assert_includes picture.errors[:title], "can't be blank"
  end
end
