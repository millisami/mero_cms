Rails.application.routes.draw do
  match "home", :to => "home#show"

  match 'login', :controller => "fake", :action => "login"
  match 'logout', :controller => "fake", :action => "logout"
  match 'unauthorized', :controller => "fake", :action => "unauthorized"
  mount MeroCms::Engine => "/mero_cms"
end
