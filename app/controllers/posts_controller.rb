class PostsController < ApplicationController
	before_action :find_post ,only: [:show,:edit,:update,:destroy]
	
  def index
  	@posts = Post.all
  end

  def show
  end
  
  def new
  	@post = Post.new
  end

  def create
     @post = Post.new(post_params)
     if @post.save!
     	flash.now[:notice] = 'The post was created!'
          redirect_to @post 
     else 
          render 'new'
     end
  end 

  def edit
  end
 
   def update
   		@post = Post.find(params[:id])
      if @post.update(post_params)
      	flash.now[:notice] = 'The post was created!'
          redirect_to @post
      else
          render 'edit'
      end
  end
  

   def destroy
    byebug
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to post_path(@post)
  end

   private

     def post_params
     params.require(:post).permit(:title, :content)
     end

     def find_post
     @post = Post.find(params[:id])
     end
  
end
