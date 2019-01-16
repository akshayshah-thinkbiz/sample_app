class MircopostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy
	def create
		@mircopost = current_user.mircoposts.build(mircopost_params)
		if @mircopost.save
			flash[:success] = "Mircopost created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@mircopost.destroy
		flash[:success] = "Mircopost deleted"
		redirect_to request.referrer || root_url
	end

	private
	def mircopost_params
		params.require(:mircopost).permit(:content, :picture)
	end

	def correct_user
		@mircopost = current_user.mircoposts.find_by(id: params[:id])
		redirect_to root_url if @mircopost.nil?
	end
end
