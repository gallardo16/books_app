class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @commentable.comments.build
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @commentable, notice: t('view.comment.flash.create')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: t('view.comment.flash.update')
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t('view.comment.flash.destroy')
  end

  private
  def set_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end
end
