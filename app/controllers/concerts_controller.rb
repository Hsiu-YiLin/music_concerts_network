class ConcertsController < ApplicationController

	def index
		@concerts_today = Concert.where("date < ?", Date.tomorrow)
		# @concerts_latermonth = Concert.where("date > ?", Date.tomorrow).where("date < ?", DateTime.end_of_month)
	# concerts_all.each do |concert|
	# 	if concert.date < DateTime.current.end_of_day
	# 		@concerts_today.push(concert)
	# 	elsif (concert.date > DateTime.end_of_month) && (concert.date < DateTime.current.end_of_day)
	# 		@concerts_latermonth << concert
	# 	end
	# end

	end

	def new
		@concert = Concert.new
	end

	def edit
		@concert = Concert.find_by(id: params[:id])
	end

	def show
		@concert = Concert.find_by(id: params[:id])
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			WelcomeMailer.welcome_email(@user).deliver_now
			redirect_to user_path
		else
			render :new
		end
	end
	
end
