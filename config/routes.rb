Rails.application.routes.draw do

  ##static home page
  root 'static_pages#home'

  ##Static Help Page displays in-App README 
  get 'static_pages/help'

  ##More about me:
  get 'static_pages/about'



  

end
