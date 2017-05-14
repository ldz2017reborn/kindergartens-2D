class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]
  before_action :validate_search_key, only: [:search]

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

  def search
    if @query_string.present?
      search_result = Post.ransack(@search_criteria).result(:distinct => true)
      @resumes = search_result.paginate(:page => params[:page], :per_page => 5 )
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { :title_or_name_or_category_or_location_cont => query_string }
  end



  private

  def post_params
    params.require(:post).permit(:content)
  end

end
