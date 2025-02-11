Rails.application.routes.draw do
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blog
  # resources :contact_us
  # resources :about_us
  resources :about_us, :path => '/about-us'
  resources :contact_us, :path => '/contact-us'
end
