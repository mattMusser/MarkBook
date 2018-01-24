class UserMailer < ApplicationMailer
	default from: ENV['EMAIL']

	def welcome_email
		@user = params[:user]
		@url 	= 'http://example.com/users/sign_in'
		mail(to: @user.email, subject: 'Welcome to MarkShareto')
	end
end
