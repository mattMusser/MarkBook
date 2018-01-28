ActionMailer::Base.smtp_settings = {
	port:										587,
	address:								'smtp.sendgrid.net',
	user_name:							ENV['SENDGRID_LOGIN'],
	password:								ENV['SENDGRID_PASSWORD'],
	domain:									'mark-share.herokuapp.com',
	authentication:					'plain',
	enable_starttls_auto:		true
}
ActionMailer::Base.delivery_method = :smtp

# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure that local mail only emails you.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails

#class DevelopmentMailInterceptor
#	def self.delivering_email(message)
#		message.to = 	ENV['EMAIL']
#		message.cc = 	nil
#		message.bcc = nil
#	end
#end

# Locally, outgoing mail will be 'intercepted' by the
# above DevelopmentMailInterceptor before going out
#if Rails.env.development?
#	ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
#end