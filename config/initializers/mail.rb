#ActionMailer::Base.smtp_settings = {
#	port:										587,
#	address:								'smtp.sendgrid.net',
#	user_name:							ENV['SENDGRID_LOGIN'],
#	password:								ENV['SENDGRID_PASSWORD'],
#	domain:									'mark-share.herokuapp.com',
#	authentication:					'plain',
#	enable_starttls_auto:		true
#}

ActionMailer::Base.smtp_settings = {
	port:										587,
	address:								'smtp.sendgrid.net',
	user_name:							ENV['MAILGUN_SMTP_LOGIN'],
	password:								ENV['MAILGUN_SMTP_PASSWORD'],
	domain:									'mark-share.herokuapp.com',
	authentication:					'plain',
	content_type:						'text/html'
}
ActionMailer::Base.delivery_method = :smtp

# Makes debugging *way* easier.
ActionMailer::Base.raise_delivery_errors = true
