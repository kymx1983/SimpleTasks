class CommentController < ApplicationController
  def new
  end

  def edit
  end

  def create
    @comment = Comment.new
    @comment.type = params[:type]
    @comment.type_id = params[:id]
    @comment.comment = params[:comment]

    @comment.save
    # render("task/show/#{params[:id]}")
    redirect_to("/task/show/#{params[:id]}")
  end
end
