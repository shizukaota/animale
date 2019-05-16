class StoresController < ApplicationController
	def new
		@store = Store.new
    @store.storeimages.build
    @store.menus.build
	end

	def create
		store = Store.new(store_params)
    logger.debug store.errors.inspect
		store.save
		redirect_to stores_path
	end

	def index
		@stores = Store.all
  end

  def show
    	@store = Store.find(params[:id])
      @storeimages = Storeimage.where( params[:image_id])
      @menus = Menu.where(params[:food])
  end

  def edit
    	@store = Store.find(params[:id])
  end

  def update
    	store = Store.find(params[:id])
    	store.update(store_params)
    	redirect_to store_path(store.id)
  end

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
   private

   def store_params
   	params.require(:store).permit(:user_id, :storename, :image, :city, :category, :system, :place, :tag,:post ,:comment, storeimages_attributes:[:id,:image,:_destroy ], menus_attributes:[:id, :drink, :food, :_destroy ])
   end

end