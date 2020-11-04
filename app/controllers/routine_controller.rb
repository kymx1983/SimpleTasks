class RoutineController < ApplicationController
  def index
  end

  def show
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
end
