class CommentController < ApplicationController
  def new
  end

  def edit
  end

  def create
    @comment = Comment.new
    @comment.comment_type = params[:comment_type]
    @comment.type_id = params[:id]
    @comment.comment = params[:comment]

    @comment.save

    flash[:notice] = "コメントを追加しました。"
    redirect_to("/task/show/#{params[:id]}")

  end
end
