class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private 
  
  Users = { "admin" => "password" }
  
  def authenticate
    realm = "My Blog"
    authenticate_or_request_with_http_digest(realm) do |name|
      Users[name]
    end
  end
end
