Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :employees do
        post :login
        post :create
        get :me
        delete :logout
      end
    end
  end
end