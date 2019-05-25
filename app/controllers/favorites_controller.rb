class FavoritesController < ApplicationController
 before_action :authenticate_user!
    def index
    	@favorites = Favorite.where(user_id:current_user)
    end

	def create
         user = current_user
         store = Store.find(params[:store_id])
         favorite = current_user.favorite.new(store_id: store.id)
         favorite.save
         redirect_to store_path(store)
    end

    def destroy
         store = Store.find(params[:store_id])
         favorite = current_user.favorites.find_by(store_id: store.id)
         favorite.destroy
         redirect_to store_path(store)
     end

def paramas
    params.require(:favorite ).permit(:user_id,:store_id )
end

end

