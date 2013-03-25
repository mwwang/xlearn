class UsersController < ApplicationController
	before_filter :authenticate_user!, only: [:index, :edit, :update]

	def index
		@users = User.all
	end

  def show
  	@user = User.find(params[:id])
  	# @user = current_user
  end
end
