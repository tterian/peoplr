Rails.application.routes.draw do
	
	root 				'pages#welcome'
	get 	'search' => 'pages#search'

end
