class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:new, :create, :show, :edit, :update, :destroy]

  def show
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to category_task_path(@category, @task), notice: "Task created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to category_task_path(@category, @task), notice: "Task updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to category_path(@task.category), notice: "Task deleted."
  end

  def today
    @tasks = current_user.tasks.where(due_date: Date.today)
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:title, :note, :due_date)
  end
end
