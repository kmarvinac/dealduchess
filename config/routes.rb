Rails.application.routes.draw do
  # Routes for the Place resource:
  # CREATE
  get "/places/new", :controller => "places", :action => "new"
  post "/create_place", :controller => "places", :action => "create"

  # READ
  get "/places", :controller => "places", :action => "index"
  get "/places/:id", :controller => "places", :action => "show"

  # UPDATE
  get "/places/:id/edit", :controller => "places", :action => "edit"
  post "/update_place/:id", :controller => "places", :action => "update"

  # DELETE
  get "/delete_place/:id", :controller => "places", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
