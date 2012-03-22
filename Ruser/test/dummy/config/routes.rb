Rails.application.routes.draw do

  mount Ruser::Engine => "/ruser",:as=>"ruser"
end
