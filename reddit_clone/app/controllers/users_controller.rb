class UsersController < ApplicationController
    before_action :require_logged_in, only: [:show, :update]

    def index
        @users = User.all
        render :index
    end

    def create
        @user = User.new(user_params)
        if @user && @user.save
            login(@user)
            redirect_to users_url
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_url
        end
    end

    def new
        @user = User.new
        render :new
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.id == current_user.id
            if @user.update(user_params)
                redirect_to users_url
            else
                flash[:errors] = @user.errors.full_messages
                redirect_to new_session_url
            end
        end
    end

    def show 
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        else
            redirect_to users_url
            flash[:errors] = @user.errors.full_messages
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end
