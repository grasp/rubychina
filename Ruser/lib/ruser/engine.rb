require "bootstrap-rails"
module Ruser
  class Engine < ::Rails::Engine
    #load all helper, otherwise will cover by parent app with same name
    initializer 'Ruser::Application.helper,Ruser::User.helper,Ruser::ApplicationController' do |app|
      ActionView::Base.send :include, Ruser::ApplicationHelper,Ruser::UsersHelper
      #  ActionController::Base .send :include,  ApplicationHelper,UsersHelper
 end

    config.i18n.default_locale = "zh-CN"
    config.autoload_paths += %W(#{config.root}/uploaders)
    config.autoload_paths += %W(#{config.root}/lib)
    config.time_zone = 'Beijing'

    #   config.i18n.load_path += Dir[config.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.load_path += Dir[config.root.join('locales', '*.{rb,yml}').to_s]
 
    config.encoding = "utf-8"

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
    
    config.to_prepare {
      Devise::Mailer.layout "mailer"
      
    }

    isolate_namespace Ruser
  end
end
I18n.locale = 'zh-CN'
require 'yaml'
YAML::ENGINE.yamler= 'syck'