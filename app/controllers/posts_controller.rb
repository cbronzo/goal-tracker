class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id].present?
      @posts = Post.where(user_id: params[:user_id])
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new post_params
    if @post.save
      redirect_to user_post_path(current_user.id, @post.id), notice: 'Post created'
    else
      flash[:alert] = @post.errors.full_messages.join("; ")
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


  private

  def set_post
    @post = Post.find params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :description, :due_date, :ongoing, :difficulty, :category, :priority, :progress, :question)
  end

end
