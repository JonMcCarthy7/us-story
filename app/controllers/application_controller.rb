class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_relationship
    @current_relationship ||= current_user.relationship if current_user
  end
end
