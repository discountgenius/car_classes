Revdata::Application.routes.draw do
  resources :versions

  resources :car_classes do
    get :merge, on: :member
    post :do_merge, on: :member
  end

end
