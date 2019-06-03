class PostsController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:show,:edit]

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
    redirect_to store_path(@store.id)
end


def show
end

def edit
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
    redirect_to stores_path
end



def list
end

private


def post_params
  params.require(:post).permit(:user_id,:store_id,:comment, :image)
end

def correct_user
    @post = Post.find(params[:id])
    @store = @post.store
    @user = @post.user
    if @user.id != current_user.id
        redirect_to root_path
    end
end

end
