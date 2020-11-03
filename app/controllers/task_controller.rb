class TaskController < ApplicationController
  def index
    @tasks = Task.all
    @today = Date.today
  end

  def search
    value = params[:search_date]

    @tasks = Task.where(limit_date:value)
    @today = Date.today

    render("task/index")
  end

  def show
    @task = Task.find_by(id:params[:id])


    @comments = Comment.where(comment_type:1, type_id:params[:id])


  end

  def new
    @task = Task.new
    @task.limit_date = Date.today
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

  def edit
    @task = Task.find_by(id:params[:id])
  end

  def update
    @task = Task.find_by(id:params[:id])

    @task.title = params[:title]
    @task.content = params[:content]
    @task.limit_date = params[:limit_date]
    @task.status = 0

    if @task.save
      redirect_to('/task/index')
    else
      render("task/edit")
    end
  end

  def destroy
    @task = Task.find_by(id:params[:id])
    @task.destroy

    redirect_to("/task/index")
  end
end
