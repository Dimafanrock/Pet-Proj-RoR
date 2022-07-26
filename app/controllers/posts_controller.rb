class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit,  :destroy, :completed]
  
    def index
      @posts = case params[:filter]
              when 'Done'
                Post.where(completed: true)
              when  'Inconplited'
                Post.where(completed: false)
              else
                Post.all        
              end.order(date: :desc, priority: :asc, title: :asc  )
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
        render :edit 
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