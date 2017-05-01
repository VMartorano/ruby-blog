class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(
      user_id: session[:user_id],
      post_id: session[:post_id]
      content: params[:comment][:content]
    )

    if @comment.save
      flash[:notice] = "Posted!"
      redirect_to show_post_path
    else
      flash[:alert] = "Unable to post"
      redirect_to new_comment_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.content = params[:comment][:content]

    if @comment.save
      flash[:notice] = "Changes saved!"
      redirect_to show_post_path(@comment)
    else
      flash[:alert] = "Unable to save changes"
      redirect_to edit_comment_path(@comment)
    end
  end


  def show
    @comment = Comment.find(params[:id])
  end

    def destroy

    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Comment deleted successfully."
      session[:comment_id] = nil
      redirect_to posts_path
    else
      flash[:alert] = "There was a problem deleting the comment"
      redirect_to edit_comment_path
    end

  end
end
