class KindergartensController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :join, :quit]

  def show
   @kindergarten = Kindergarten.find(params[:id])
   @posts = @kindergarten.post.order("created_at DESC")

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
       current_user.join!(@kindergarten)
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

  def join
   @kindergarten = Kindergarten.find(params[:id])

    if !current_user.is_member_of?(@kindergarten)
      current_user.join!(@kindergarten)
      flash[:notice] = "加入本讨论版成功！"
    else
      flash[:warning] = "你已经是本讨论版成员了！"
    end

    redirect_to kindergarten_path(@kindergarten)
  end

  def quit
    @kindergarten = Kindergarten.find(params[:id])

    if current_user.is_member_of?(@kindergarten)
      current_user.quit!(@kindergarten)
      flash[:alert] = "已退出本讨论版！"
    else
      flash[:warning] = "你不是本讨论版成员，怎么退出 XD"
    end

    redirect_to kindergarten_path(@kindergarten)
  end


   private

   def kindergarten_params
     params.require(:kindergarten).permit(:title, :description, :fee, :phone, :is_hidden)
   end


end
