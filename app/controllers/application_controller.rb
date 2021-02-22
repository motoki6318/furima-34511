class ApplicationController < ActionController::Base
  befor_action :basic_auth

  private

  def basic_auth
    authencate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
