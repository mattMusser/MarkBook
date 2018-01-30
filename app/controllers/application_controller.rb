class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  puts "SENDGRID_LOGIN: #{ENV['SENDGRID_LOGIN']}"
  puts "SENDGRID_PASSWORD: #{ENV['SENDGRID_PASSWORD']}"

end
