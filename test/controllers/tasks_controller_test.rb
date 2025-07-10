require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.create!(email: "test@email.com", password: "password")
    sign_in @user
    @category = @user.categories.create!(name: "Test Category", description: "A test category")
    @task = @category.tasks.create!(title: "Test Task", note: "A note", due_date: Date.today)
  end

  test "should show task" do
    get category_task_path(@category, @task)
    assert_response :success
  end

  test "should get new task" do
    get new_category_task_path(@category)
    assert_response :success
  end
end
