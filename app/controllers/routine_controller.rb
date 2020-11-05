class RoutineController < ApplicationController
  def index
    @routine = Routine.all
  end

  def show
    @routine = Routine.find_by(id: params[:id])
  end

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new
    @routine.title = params[:title]
    @routine.content = params[:content]

    if @routine.save
      redirect_to('/routine/index')
    else
      render("routine/new")
    end
  end

  def destroy
    @routine = Routine.find_by(id: params[:id])
    @routine.destroy

    redirect_to("/routine/index")
  end

  def edit
    @routine = Routine.find_by(id: params[:id])
  end

  def update
    @routine = Routine.find_by(id: params[:id])

    @routine.title = params[:title]
    @routine.content = params[:content]

    if @routine.save
      redirect_to('/routine/index')
    else
      render("routine/edit")
    end
  end

end
