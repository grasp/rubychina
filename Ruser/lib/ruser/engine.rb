module Ruser
  class Engine < ::Rails::Engine
   #load all helper, otherwise will cover by parent app with same name
      initializer 'Ruser::Application.helper,Ruser::User.helper' do |app|
      ActionView::Base.send :include, ApplicationHelper,UsersHelper
    end
    isolate_namespace Ruser
  end
end
