class StoresController < ApplicationController

	def new
		@store = Store.new
    # @store.tag_list = Store.where(params[:tag_list])
    # @store.tag_list.add(params[:tag_list]).split
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
    # if params[:q].present?
     @search = Store.ransack(params[:q])
    # @results = @search.result

    # # タグ検索
    # @tag_search = Store.tagged_with(params[:tag_list])

   # else
    @stores = Store.all
   # end
  end

  def search

    groupings = []  # 空配列生成
    @tag_search = Store.tagged_with(params[:q])
    # @tag_search = Store.tagged_with(params[:tag_list])

    # if params[:q].present?
    #   # binding.pry
    #   keywords = params[:q][:tags_name_cont].split(/[\p{blank}\s]+/)
    #    # binding.pry
    #   keywords.each { |value| groupings.push(tags_name_cont: value) }
    #   # binding.pry
    #   @search = Store.ransack( combinator: 'or', groupings: groupings )
    #    # binding.pry
    #   @stores = @search.result(distinct: true)


    # elsif 

    #  @search = Store.ransack(params[:q])
    #  @c = @search.result(distinct: true)

    # else
    #  @stores = Store.all

    # end
    # binding.pry
    redirect_to searchs_path
  end


  def show
   @store = Store.find(params[:id])
   @storeimages = Storeimage.where(params[:image_id])
   @menus = Menu.where(params[:food])
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
    redirect_to store_path(post)
 end

 def favorited_by?(user)
  favorites.where(user_id: user.id).exists?
end

private

def login_check
  unless user_signed_in?
    flash[:alert] = "ログインしてください"
    redirect_to root_path
  end
end

def admin_user
    redirect_to(root_path) unless current_user.admin?
end

def store_params
  params.require(:store).permit(:user_id, :storename, :image, :city, :category, :system, :place,:phone_number, :post, :tag_list, storeimages_attributes:[:id,:image,:_destroy ], menus_attributes:[:id, :drink, :food, :_destroy ])
end

end
