Rails.application.routes.draw do
  root "examples#index"

  get "stream01", to: "examples#stream01"
end
