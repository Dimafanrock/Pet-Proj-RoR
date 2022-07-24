class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit,  :destroy, :completed]
  
    def index
      @posts = Post.all
    end
  
    def show
    end
  
    def new
      @post = Post.new
    end
  
    def edit
    end
  
    def create
      @post = Post.new(post_params)      
      if @post.save        
         redirect_to @post ,  alert: 'Goal successful created!'      
      else
        render :new
      end
    end

    
    def update
      @post = Post.find(params[:id])
      
      if @post.update(post_params)
        redirect_to @post,  alert: 'Goal successful update!' 
        
      else
        render :edit , unprocessable_entity
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_path, alert: 'Goal successful deleted!'
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :body, :priority, :date, :completed)
    end
  end