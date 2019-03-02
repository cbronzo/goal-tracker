class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new post_params
    if @post.save
      redirect_to posts_path, notice: 'Post created'
    else
      Rails.logger.info @post.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post), notice: "Post Updated"
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "Post Deleted"
    else
      redirect_to post_path(@post), error: 'Unable to Delete'
    end
  end

  # def add_cheer
  #   @cheer = Post.cheer
  #   @cheer.sum(:total)
  # end

  private

  def set_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :description, :due_date)
  end

end
