class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_company, :authenticate_person!

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def set_company
    @company = current_person.try :company
  end
end
