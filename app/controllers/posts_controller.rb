class PostsController < ApplicationController
before_action :authenticate_user!
def new
	@store = Store.find(params[:store_id])
    @post = Post.new
end

def create
	@store = Store.find(params[:store_id])
    post = Post.new(post_params)
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
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
end


def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
end


def index
	@posts = Post.all
end

def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to post_path(post)
end



def list
end

private


def post_params
  params.require(:post).permit(:user_id,:store_id,:comment, :image)
end

end
