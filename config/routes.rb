Rails.application.routes.draw do

  resources :people do
    member do
      get :asociar_car
    end
    resources :addresses
  end
  
  #get "/people" => "people#index"
  root to: "people#index"
end
