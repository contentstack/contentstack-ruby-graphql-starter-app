Rails.application.routes.draw do
  get 'contact_us/index'
  get 'about_us/index'
  get 'blog/index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :home
  resources :blog
  # resources :contact_us
  # resources :about_us
  resources :about_us, :path => '/about-us'
  resources :contact_us, :path => '/contact-us'
end
