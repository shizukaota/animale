class PostsController < ApplicationController

def new
	@store = Store.find(params[:store_id])
    @post = Post.new
end

def create
	@store = Store.find(params[:store_id])
	# @storeに親モデルのstoreのidを入れる（rouring)
    post = Post.new(post_params)
    #post は新しいpost(パラメーターで送られてきた情報を入れる)
    post.user_id = current_user.id
    post.store_id = @store.id
    post.save
    redirect_to stores_path
end


def show
	@store = Store.find(params[:id])
	@post = Post.find(params[:id])
end

def edit
    @store = Store.find(params[:id])
    @post = Post.find(params[:id])
end


def updete
    post = Post.find(params[:id])
    post.updete
    redirect_to stores_path
end


def index
	@posts = Post.all
end

private


def post_params
  params.require(:post).permit(:user_id,:store_id,:comment)
end

end
