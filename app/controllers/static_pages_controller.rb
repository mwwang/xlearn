class StaticPagesController < ApplicationController

  def home
  	@users = User.all
  	if user_signed_in?
  		@post = current_user.posts.build
  		@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end
end
