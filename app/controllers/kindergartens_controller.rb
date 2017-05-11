class KindergartensController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def show
   @kindergarten = Kindergarten.find(params[:id])
   @posts = @kindergarten.post

   if @kindergarten.is_hidden
   flash[:warning] = "This Kindergarten already archived"
   redirect_to root_path
   end
  end

  def index
    @kindergartens = case params[:order]
                      when 'by_fee'
                        Kindergarten.where(is_hidden: false).order("fee DESC")

                      else
                        Kindergarten.where(is_hidden: false).order("created_at DESC")
                      end
  end


   def new
     @kindergarten = Kindergarten.new
   end

   def create
     @kindergarten = Kindergarten.new (kindergarten_params)
     @kindergarten.user = current_user


     if @kindergarten.save
       redirect_to kindergartens_path
     else
       render :new
     end
   end

   def edit
    @kindergarten = Kindergarten.find(params[:id])
   end

    def update
      @kindergarten = Kindergarten.find(params[:id])

      if @kindergarten.update(kindergarten_params)
        redirect_to kindergartens_path
      else
        render :edit
      end
    end

    def destroy
      @kindergarten = Kindergarten.find(params[:id])

      @kindergarten.destroy

      redirect_to kindergartens_path
    end

   private

   def kindergarten_params
     params.require(:kindergarten).permit(:title, :description, :fee, :phone, :is_hidden)
   end








end
