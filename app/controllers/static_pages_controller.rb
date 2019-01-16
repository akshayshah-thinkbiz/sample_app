class StaticPagesController < ApplicationController
  def home
  	if logged_in?
  		@mircopost = current_user.mircoposts.build if logged_in?
  		@feed_items = current_user.feed.paginate(page: params[:page])
  	end
  end

  def help
  end

  def about
  end
  
  def contact
  end
  
end
