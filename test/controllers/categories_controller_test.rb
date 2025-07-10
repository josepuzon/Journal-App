require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.create!(email: "test@email.com", password: "password")
    sign_in @user
    @category = @user.categories.create!(name: "Test Category", description: "A test category")
  end

  test "should get index" do
    get categories_path
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should create an article with valid params" do
    post categories_path, params: { category: { name: "test name", description: "test description" } }

    assert_response :redirect
  end
end
