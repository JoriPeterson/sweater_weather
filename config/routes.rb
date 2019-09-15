Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  GET "/api/v1/forecast?location=denver,co"
end
