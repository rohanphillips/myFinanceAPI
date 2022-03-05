class ApiKeysController < ApplicationController
   include ApiKeyAuthenticatable

      # Require API key authentication for index
   prepend_before_action :authenticate_with_api_key!, only: [:index]
   
   # Optional API key authentication for logout
   prepend_before_action :authenticate_with_api_key, only: [:destroy]

   def index
      render json: current_bearer.api_keys
   end

   def create
      authenticate_with_http_basic do |username, password|
         user = User.find_by username: username

         if user&.authenticate(password)
            api_key = user.api_keys.create! token: SecureRandom.hex

            render json: api_key, status: :created and return
         end
      end
      
      render status: :unauthorized
   end

   def show

   end

   def destroy

   end
end