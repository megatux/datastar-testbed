Rails.application.routes.draw do
  root "examples#index"

  resources :click_to_edit
  get "stream01", to: "examples#stream01"
  get "stream02", to: "examples#stream02"
end
