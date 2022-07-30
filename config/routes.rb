Rails.application.routes.draw do

get "/", to: "bookstore#home"

resources :books

end
