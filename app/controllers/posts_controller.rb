class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    # binding.pry
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      @post.update(post_params)
      @new_post = Post.new(post_params)
    if @new_post.valid?

      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
