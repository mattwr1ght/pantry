Rails.application.routes.draw do
  root "welcome#index"

  get "/welcome", to: "welcome#index"
  get "/home", to: "home#index"
  get "/home/:id", to: "home#show"
end
