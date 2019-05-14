class FovoritesController < ApplicationController

    def index
    end
	def create
            store = Store.find(params[:store_id])
            favorite = current_user.favorites.new(store_id: store.id)
            favorite.save
            redirect_to store_path(store)
     end

    def destroy
            store = Store.find(params[:store_id])
            favorite = current_user.favorites.find_by(store_id: store.id)
            favorite.destroy
            redirect_to store_path(store)
     end
end
