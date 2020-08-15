class TaskController < ApplicationController
  def index
  end

  def show
  end

  def new
    @Task = Task.new
  end
end
