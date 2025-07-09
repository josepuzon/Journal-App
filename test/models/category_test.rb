require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should not save a category without a name" do
    user = User.create!(email: "test@email.com", password: "password")
    category = Category.new(description: "test description", user: user)
    assert_not category.save
  end

  test "should not save a category without a description" do
    user = User.create!(email: "test@email.com", password: "password")
    category = Category.new(name: "test name", user: user)
    assert_not category.save
  end

  test "should save a category with valid params" do
    user = User.create!(email: "test@email.com", password: "password")
    category = Category.new(name: "test name", description: "test description", user: user)
    assert category.save
  end
end
