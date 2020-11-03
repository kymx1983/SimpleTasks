class TaskController < ApplicationController
  def index
    @tasks = Task.all
    @today = Date.today
  end

  def search
    limit_date = params[:search_date]
    @today = Date.today

    where = "limit_date = ? or limit_date < ?"
    @tasks = Task.where(where, limit_date, @today)

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

  def close

    @task = Task.find_by(id:params[:id])

    @task.status = 1

    if @task.save
      redirect_to('/task/index')
    else
      redirect_to('/task/index')
    end

    #タスクの状況を完了にする

    # 完了コメントがあれば登録する
    # @comment = Comment.new
    # @comment.comment_type = params[:comment_type]
    # @comment.type_id = params[:id]
    # @comment.comment = params[:comment]
    # @comment.save
    #
    # redirect_to("/task/show/#{params[:id]}")
  end
end
