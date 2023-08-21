Rails.application.routes.draw do
  get 'homes/index'
  get 'contact_us/index'
  get 'about_us/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  resources :blogs
  resources :about_us, :path => '/about-us'
  resources :contact_us, :path => '/contact-us'
end
