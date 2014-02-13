class CommentsController < ApplicationController
  before_filter :authenticate_user!

  # GET, start to create a comment for a given post (collect attributes)
  def new
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.new
  end

  # POST, create a comment for a given post (persist attributes)
  def create
  	new_comment = params.require(:comment).permit(:body)
  	post = Post.find(params[:post_id])
  	comment = post.comments.create(new_comment)
    comment.update(user_id: current_user.id)

  	redirect_to post_comment_path(post, comment)
  end

  # POST (per rake routes), display comment based on passed in post & comment ids
  def show
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.find(params[:id])
  end

end
