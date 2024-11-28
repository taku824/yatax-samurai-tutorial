class PostsController < ApplicationController
  allow_browser versions: :modern

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    built_post = current_user_account.posts.build(post_params)

    if built_post.save
      redirect_to "/posts"
    else
      Rails.logger.debug("Post save failed: #{built_post.errors.full_messages}")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
