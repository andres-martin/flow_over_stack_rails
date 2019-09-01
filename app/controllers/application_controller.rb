# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #   def public_access
  #     redirect_to root_path if user_signed_in?
  #   end
end
