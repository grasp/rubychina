#coding:utf-8
# To change this template, choose Tools | Templates
# and open the template in the editor.
#require  File.dirname(__FILE__) + "/../test_helper.rb"
start_time=Time.now
#require 'watir'
require  'rubygems'
require 'active_support/all'
require "test/unit"
#require 'watir/close_all'  
require 'watir-webdriver'
puts "load test env cost #{Time.now-start_time} sec"

def prepare_watir
  @browser =Watir::Browser.new :chrome
  @site_root= "http://localhost:3000/ruser"  
  @browser.goto(@site_root)
 # user_logout(@browser,@site_root) #make sure user is logout  
  get_permanent_user
  define_user_1
  define_user_2
end

def get_permanent_user
  # @permanent_user=Yiuser::User.where(:name=>"permanent_user").first  
  #create if permanent user not created
  # if @permanent_user.nil?
  #   Yiuser::User.create(:name=>"permanent_user")
  # end
end

def define_user_1
  @user_name1=Time.now.to_s.gsub(/\s|:|\+/,"").to_s 
  @user_email1="#{@user_name1}@gmail.com"
  @mobile_phone1=@user_name1.slice(9,18)
  @paizhao1=@mobile_phone1.slice(0,6)
end

def define_user_2
  @user_name2=Time.now.to_s.gsub(/\s|:|\+/,"").to_s 
  @user_email2="#{@user_name2}@gmail.com"
  @mobile_phone2=@user_name2.slice(9,18)
  @paizhao2=@mobile_phone2.slice(0,6)
end

def user_logout(browser,site_root)
 # puts "start user logout"
  browser.goto("#{site_root}/users/logout");sleep 0.5
   ["用户登录","用户名"].each { |text|  assert browser.text.include?(text),"#{text} 不存在 !!"} 
     puts "start user logout2"
   browser.goto("#{site_root}/users/status");sleep 0.5
   puts "start user logout3"
    ["已登出"].each { |text|  assert browser.text.include?(text),"#{text} 不存在 !!"} 
   # browser.refresh
    #puts "end of user logout"
end

def user_login(browser,site_root,username,password)  
  # puts "start user login"
  browser.goto("#{site_root}/users/login")
  browser.text_field(:id, "email").set(username)
  browser.text_field(:id, "password").set(password)
  browser.button(:value, "登  录").click;sleep 0.5
   browser.goto("#{site_root}/users/status");sleep 0.5
    ["已登录"].each { |text|  assert browser.text.include?(text),"#{text} 不存在 !!"} 
end

def user_logout_login(browser,site_root,username,password)
  user_logout(browser,site_root)
  user_login(browser,site_root,username,password)
end

def user_fill_register_form(browser,site_root,user_login,user_name,user_email,password,mobile_phone)
    puts "start user register"
  browser.goto("#{site_root}/account/sign_up")  
  #["用户注册","创建登录信息"].each { |text|  assert browser.text.include?(text),"#{text} 不存在 !!"} 
  browser.text_field(:id, "user_login").set(user_login)
  browser.text_field(:id, "user_name").set(user_name)
  browser.text_field(:id, "user_email").set(user_email)  
  browser.text_field(:id, "user_password").set(password)
  browser.text_field(:id, "user_password_confirmation").set(password)
  browser.button(:name, "commit").click;sleep 3

   # ["已登录"].each { |text|  assert browser.text.include?(text),"#{text} 不存在 !!"} 

end


