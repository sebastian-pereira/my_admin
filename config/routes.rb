Rails.application.routes.draw do
  #get '/', :controller => 'my_admin/users', :action => :index
  #get '/roles', :controller => 'my_admin/user_roles', :action => :index
  
  namespace :my_admin do
    #resources :universities
    #resources :users
    #resources :faculties
  end

  match 'admin_area', :controller => 'my_admin/base', :action => :index
  match 'admin_area/universities', :controller => 'my_admin/base', :action => 'model_action', :model => 'universities', :act => 'view'
  match 'admin_area/universities/add', :controller => 'my_admin/base', :action => 'model_action', :model => 'universities', :act => 'add'
  match 'admin_area/universities/edit', :controller => 'my_admin/base', :action => 'model_action', :model => 'universities', :act => 'edit'
  match 'admin_area/universities/save', :controller => 'my_admin/base', :action => 'model_action', :model => 'universities', :act => 'save'
  match 'admin_area/universities/delete', :controller => 'my_admin/base', :action => 'model_action', :model => 'universities', :act => 'delete'
  match 'admin_area/universities/delete/:id', :controller => 'my_admin/base', :action => 'model_action', :model => 'universities', :act => 'delete', :id => :id

  match 'admin_area/faculties', :controller => 'my_admin/base', :action => 'model_action', :model => 'faculties', :act => 'view'
  match 'admin_area/faculties/add', :controller => 'my_admin/base', :action => 'model_action', :model => 'faculties', :act => 'add'
  match 'admin_area/faculties/edit', :controller => 'my_admin/base', :action => 'model_action', :model => 'faculties', :act => 'edit'
  match 'admin_area/faculties/save', :controller => 'my_admin/base', :action => 'model_action', :model => 'faculties', :act => 'save'
  match 'admin_area/faculties/delete', :controller => 'my_admin/base', :action => 'model_action', :model => 'faculties', :act => 'delete'
  match 'admin_area/faculties/delete/:id', :controller => 'my_admin/base', :action => 'model_action', :model => 'faculties', :act => 'delete', :id => :id


  get 'admin_area/universities', :controller => 'my_admin/universities', :action => :index
  get 'admin_area/universities/edit', :controller => 'my_admin/universities', :action => :edit
  post 'admin_area/universities/save', :controller => 'my_admin/universities', :action => :save

  get 'admin_area/users', :controller => 'my_admin/users', :action => :index
  get 'admin_area/users/edit', :controller => 'my_admin/users', :action => :edit
  post 'admin_area/users/save', :controller => 'my_admin/universities', :action => :save

  get 'admin_area/faculties', :controller => 'my_admin/faculties', :action => :index
  get 'admin_area/faculties/edit', :controller => 'my_admin/faculties', :action => :edit
  post 'admin_area/faculties/save', :controller => 'my_admin/universities', :action => :save

  #get '/universities', :controller => 'my_admin/university', :action => :index
  #get "/:modl", :controller => "my_admin/:modl", :action => :index
  get '/faculties', :controller => 'my_admin/faculty', :action => :index
  match 'user/:action', :controller => 'my_admin/user', :action => :action
  match 'admin_area/model/:model/:action', :controller => 'my_admin/model', :model => :model, :action => :action
end