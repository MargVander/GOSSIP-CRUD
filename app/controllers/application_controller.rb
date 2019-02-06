class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception # => key to protect the form
end
