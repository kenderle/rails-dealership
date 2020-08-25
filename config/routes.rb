Rails.application.routes.draw do
  resources :dealerships
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :employees do
        post :login
        post :create
        get :me
        delete :logout
      end
      namespace :dealerships do
        get :index
        get :show
        post :create
        patch :update
        delete :destroy
        get :get_upload_credentials
      end
      namespace :cars do
        get :index
        get :show
        post :create
        patch :update
        delete :destroy
        get :get_upload_credentials
      end
    end
  end
end