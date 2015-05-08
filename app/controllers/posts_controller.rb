class PostsController < ApplicationController
before_action :set_post, :only => [:edit, :show, :update, :destroy]
  load_and_authorize_resource
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
            gflash success: "Post was successfully created."
      		redirect_to posts_path
  	else
        gflash :now, error: @post.errors.full_messages.join("<br/>").html_safe
     		render "new"
  	end
  end

  def edit
  end

  def update
    #    authorize! :update, @post
  	if @post.update(post_params)
  		redirect_to posts_path
  	else
  		render "edit"
  	end
  end

  def show
    #  authorize! :read, @post
  end

  def destroy
   # authorize! :delete, @post
  	@post.destroy
  	redirect_to posts_path
  end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit!
  end

end
