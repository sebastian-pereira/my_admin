Rails.application.routes.draw do
  match 'admin_area', :controller => 'my_admin/base', :action => :index
  match 'admin_area/:model', :controller => 'my_admin/base', :action => 'model_action', :model => :model, :act => 'index'
  match 'admin_area/:model(/:act)', :controller => 'my_admin/base', :action => 'model_action', :model => :model, :act => :act
  match 'admin_area/model/:model/:action', :controller => 'my_admin/model', :model => :model, :action => :action
end