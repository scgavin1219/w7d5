class SubsController < ApplicationController
    before_action :require_logged_in, only: [:create, :update]
    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub && @sub.save
            redirect_to sub_url
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = current_user.subs.find_by(id: params[:id])
        if @sub && @sub.moderator_id == current_user.id
            if @sub.update(sub_params)
                redirect_to sub_url(@sub.id)
            else
                flash.now[:errors] = @sub.errors.full_messages
                render :edit
            end
        end
    end

    def index
        @subs = Sub.all
        render :index
    end

    private 
    def sub_params
        params.require(:sub).permit(:title, :description)
    end


end
