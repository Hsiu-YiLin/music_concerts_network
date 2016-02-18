class WelcomeMailer < ApplicationMailer
	default from: 'okay@giggly.com'
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: "Welcome, #{@user.name}")
	end

end
