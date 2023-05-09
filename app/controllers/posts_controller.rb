class PostsController < ApplicationController
  protect_from_forgery
  before_action :set_user, only: %w[ show edit update destroy ]
  def index
    @posts = Post.all.order(created_at: :desc).includes(:user).page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    #binding.pry
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
