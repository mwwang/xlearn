class UsersController < ApplicationController
	before_filter :authenticate_user!, only: [:index, :edit, :update]
	before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def edit
  end

	def index
		@users = User.paginate(page: params[:page])
	end

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.paginate(page: params[:page])
  	# @user = current_user
  end

  def destroy
  	@user = User.find(params[:id]).destroy
  	flash[:success] = "User deleted"
  	redirect_to users_url
  end

  	private
  		def admin_user
      	redirect_to(root_path) unless current_user.admin?
    	end

	    def signed_in_user
	      redirect_to signin_url, notice: "Please sign in." unless signed_in?
	    end

	    def correct_user
	      @user = User.find(params[:id])
	      redirect_to(root_path) unless current_user?(@user)
	    end
end
