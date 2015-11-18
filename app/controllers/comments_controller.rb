class CommentsController < ApplicationController

  def create

    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.creator = @post.creator

    if @comment.save
      flash[:notice] = "Your comment was created."
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end