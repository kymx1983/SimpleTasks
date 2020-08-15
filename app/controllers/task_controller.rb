class TaskController < ApplicationController
  def index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    @task.title = params[:title]
    @task.content = params[:content]
    @task.limit_date = params[:limit_date]
    @task.status = 0

    if @task.save
      redirect_to('/task/index')
    else
      render("task/new")
    end
  end
end
