class PostsController < ApplicationController
 
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

  	post = Post.create(new_post)
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







