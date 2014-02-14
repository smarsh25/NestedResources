class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :show, :destroy]
 
 	# GET, list of posts
  def index
  	@posts = Post.all
  end

  # GET, start of creating a new Post (obtain attributes)
  def new
  	@post = Post.new
  end

  # POST, finalize the creation of new Post (persist attributes)
  def create
  	# collects nested attributes, for post & comment, from params
    new_post = params.require(:post).permit(:body, :link, comments_attributes: [:body])
    # seems hacky, but add user id to comment (wasn't included in form params)
    new_post["comments_attributes"]["0"]["user_id"] = current_user.id

  	post = current_user.posts.create(new_post)
  	redirect_to post_path(post.id)
  end

  # POST (per rake routes), display post based on passed in post id
  def show
  	@post = Post.find(params[:id])
  end

  # DELETE, delete current post (and associated comments)
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_url
  end

end







