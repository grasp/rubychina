# coding: utf-8
module Ruser
class AccountController < Devise::RegistrationsController
     before_filter :set_locale

def set_locale
 # I18n.locale = extract_locale_from_tld || I18n.default_locale
 I18n.locale = "zh-CN"
end
  def edit
    @user = current_user
    # 首次生成用户 Token
    @user.update_private_token if @user.private_token.blank?
  end

  def update_private_token
    current_user.update_private_token
    render :text => current_user.private_token
  end

  # POST /resource
  def create
    build_resource
   # puts "resource.name=#{resource.name}"
   #     puts "resource.login=#{resource.login}"
   #       puts " resource.email=#{ resource.email}"
    resource.login = params[resource_name][:login]
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def destroy
    resource.soft_delete
    sign_out_and_redirect("/login")
    set_flash_message :notice, :destroyed
  end
end
end
