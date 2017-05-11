class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @kindergarten = Kindergarten.find(params[:kindergarten_id])
    @post = Post.new
  end

  def create
    @kindergarten = Kindergarten.find(params[:kindergarten_id])
    @post = Post.new(post_params)
    @post.kindergarten = @kindergarten
    @post.user = current_user

    if @post.save
      redirect_to kindergarten_path(@kindergarten)
    else
      render :new
    end
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

end
