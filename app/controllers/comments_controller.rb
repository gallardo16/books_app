class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comment = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.repuire(:comment).permit(:content, :commentable_type, :commentable_id)
  end
end
