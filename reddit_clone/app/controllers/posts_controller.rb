class PostsController < ApplicationController
    before_action :require_logged_in

    def new
        @post = Post.new
        render :new
    end

    def create
        # debugger
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        @post.sub_id = params[:sub_id]
        if @post && @post.save
            redirect_to sub_url(@post.sub_id)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post && current_user.id == @post.author_id
            if @post.update(post_params)
                redirect_to sub_post_url(@post.sub_id)
            else
                flash.now[:errors] = @post.errors.full_messages
                render :edit
            end
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end
