Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :content_urls do
    resources :contents
  end
  get :list_contents, to: 'content_urls#list_contents'
end
