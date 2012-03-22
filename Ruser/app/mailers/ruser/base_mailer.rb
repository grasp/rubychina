# coding: utf-8
require "resque"
class Ruser::BaseMailer < ActionMailer::Base
  include Ruser::UsersHelper
 # default :from => Setting.email_sender
 default :from => "hunter.wxhu@gmail.com"
  default :charset => "utf-8"
  default :content_type => "text/html"
 # default_url_options[:host] = Setting.domain
  default_url_options[:host] = "google.com"
  include Resque::Mailer

  layout 'mailer'
 # helper :topics, :users
#  helper  :users
end
