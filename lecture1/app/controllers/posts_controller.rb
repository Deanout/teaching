class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
			if @post.save
				redirect_to @post, notice: 'Post was successfully created.'
			else
				render :new, alert: 'Creating post failed!'
			end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to @post, notice: 'Post was successfully updated.'
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path, notice: 'Post was successfully deleted.'
	end
	
	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end
