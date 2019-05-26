class StoresController < ApplicationController
  before_action :admin_user, only:[:destroy, :new, :create,:update,:edit ]


	def new
		@store = Store.new
    tags = params[:tag_list]
    @store.tag_list = tags
    @store.storeimages.build
    @store.menus.build
    @store.save
  end

  def create
    store = Store.new(store_params)
    store.save
    redirect_to stores_path
  end



  def index
    @search = Store.ransack(params[:q])
    @stores = Store.page(params[:page]).reverse_order
  end

  def search
    @tag_search = Store.tagged_with(params[:q])
    redirect_to searchs_path
  end


  def show
     @store = Store.find(params[:id])
     @storeimages = Storeimage.where(params[:image_id])
     @menus = Menu.where(params[:menu])
     @post = Post.new
  end

 def edit
   @store = Store.find(params[:id])
 end

 def update
   store = Store.find(params[:id])
   store.update(store_params)
   redirect_to store_path(store.id)
 end

 def destroy
    store = Store.find(params[:id])
    store.destroy
    redirect_to store_path(store)
 end


def login_check
   unless user_signed_in?
    flash[:alert] = "ログインしてください"
    redirect_to root_path
   end
end

 def favorited_by?(user)
  favorites.where(user_id: user.id).exists?
end

private


def admin_user
    redirect_to(root_path) unless current_user.admin?
end

def store_params
  params.require(:store).permit(:user_id, :storename, :image, :city, :category, :system, :place,:phone_number, :post, :tag_list, storeimages_attributes:[:id,:image,:_destroy ], menus_attributes:[:id, :drink, :food, :_destroy ])
end

end
