class RoutineController < ApplicationController
  def index
    @routine = Routine.all
  end

  def show
    @routine = Routine.find_by(id: params[:id])
  end

  def new
    @routine = Routine.new
    @routine.limit_time = "00:00"
  end

  def create
    @routine = Routine.new
    @routine.title = params[:title]
    @routine.content = params[:content]
    @routine.limit_time = params[:limit_time]
    @routine.user_id = 1

    if @routine.save
      flash[:notice] = "「#{@routine.title}」を追加しました。"
      redirect_to('/routine/index')
    else
      flash[:alert] = "入力内容に誤りがあります。ご確認ください。"
      render("routine/new")
    end
  end

  def destroy
    @routine = Routine.find_by(id: params[:id])
    @routine.destroy

    flash[:notice] = "「#{@routine.title}」を削除しました。"
    redirect_to("/routine/index")
  end

  def edit
    @routine = Routine.find_by(id: params[:id])
  end

  def update
    @routine = Routine.find_by(id: params[:id])

    @routine.title = params[:title]
    @routine.content = params[:content]
    @routine.limit_time = params[:limit_time]
    @routine.user_id = 1

    if @routine.save
      flash[:notice] = "「#{@routine.title}」を編集しました。"
      redirect_to('/routine/index')
    else
      flash[:alert] = "入力内容に誤りがあります。ご確認ください。"
      render("routine/edit")
    end
  end

end
