class CommentsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def create

    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.creator = current_user

    if @comment.save
      flash[:notice] = "Your comment was created."
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end

  def vote
    @comment = Comment.find(params[:id])

    @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    if @vote.valid?
      flash[:notice] = "Thank you for your comment"
    else
      flash[:error] = "Comment not created"
    end
    redirect_to :back
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
