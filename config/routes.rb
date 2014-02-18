Frozen::Application.routes.draw do
  root 'home#main'
  get '*path' => "home#main"
end
