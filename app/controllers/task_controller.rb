class TaskController < ApplicationController
  def index
    @limit_date = Date.today
    @today = Date.today

    @tasks = get_tasks(@today, @limit_date)
  end

  def search
    @limit_date = Date.parse(params[:search_date])
    @today = Date.today
    close_display = params[:close_display]

    @tasks = get_tasks(@today, @limit_date, close_display)

    render("task/index")

  end

  def create_task_do
    @limit_date = Date.parse(params[:search_date])
    @today = Date.today

    create_task(@limit_date)

    @tasks = get_tasks(@today, @limit_date)

    flash[:notice] = "ルーティーンからタスクを作成しました。"
    render("task/index")

  end

  def show
    @task = Task.find_by(id: params[:id])
    @comments = Comment.where(comment_type: 1, type_id: params[:id])
  end

  def new
    @task = Task.new
    @task.limit_date = Date.today
    @task.limit_time = "00:00"
  end


  def create

    puts "時刻を表示"
    puts params[:limit_time]

    @task = Task.new
    @task.title = params[:title]
    @task.content = params[:content]
    @task.limit_date = params[:limit_date]
    @task.limit_time = params[:limit_time]
    @task.status = 0

    if @task.save
      flash[:notice] = "「#{@task.title}」を追加しました。"
      redirect_to('/task/index')
    else
      flash[:alert] = "入力内容に誤りがあります。ご確認ください。"
      render("task/new")
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])

    @task.title = params[:title]
    @task.content = params[:content]
    @task.limit_date = params[:limit_date]
    @task.limit_time = params[:limit_time]
    @task.status = 0

    if @task.save
      flash[:notice] = "「#{@task.title}」を編集しました。"
      redirect_to('/task/index')
    else
      flash[:alert] = "入力内容に誤りがあります。ご確認ください。"
      render("task/edit")
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy

    flash[:notice] = "「#{@task.title}」を削除しました。"

    redirect_to("/task/index")
  end

  def cancel_status
    @task = Task.find_by(id: params[:id])
    @task.status = 0
    @task.save

    redirect_to('/task/index')
  end

  def close

    #タスクの状況を完了にする

    @task = Task.find_by(id: params[:id])
    @task.status = 1
    @task.save

    # 完了コメントがあれば登録する
    comment_string = params[:comment]

    if comment_string != ""
      @comment = Comment.new
      @comment.comment_type = params[:comment_type]
      @comment.type_id = params[:id]
      @comment.comment = comment_string
      @comment.save
    end

    flash[:notice] = "「#{@task.title}」を完了にしました。"
    redirect_to('/task/index')

  end

  private

  def get_tasks(today, limit_date, close_display = "")

    if close_display != "on"
      where = "(limit_date = ? or limit_date < ?)"
      where += " and status <> 1"
      Task.where(where, limit_date, today).order(:status).order(:limit_date)
    else
      where = "limit_date = ? or (limit_date < ? and status <> 1)"
      Task.where(where, limit_date, today).order(:status).order(:limit_date,)
    end
  end

  def create_task(limit_date)
    routine = Routine.all
    routine.each do |routine|
      task = Task.new
      task.title = routine.title
      task.content = routine.content
      task.limit_date = limit_date
      task.limit_time = routine.limit_time
      task.status = 0
      task.save
    end

  end

end

