Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root "welcome#home", as: "home_page"


 resources :users

 get "/recipes/search" => "recipes#ingredient_form", as: "recipe_search"

 post "/recipes/yummly-api-call"       => "recipes#yummly_api"
 get "/recipes/yummly-api-call" =>  "recipes#yummly_api", as: "yummly_api"
 resources :recipes

end
