# coding: utf-8
require 'pathname'
pn = Pathname.new(File.dirname(__FILE__))
helper_path=pn.parent
require File.join(helper_path,"helpers","ruser","users_helper.rb")

class BaseCell < Cell::Rails
   # helper :application, :users, :topics, :locations
include Ruser::ApplicationHelper
include Ruser::UsersHelper

end

