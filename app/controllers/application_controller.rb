class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_company
  before_filter :authenticate_person!
  before_filter :search_person

  def search_person
    query = params[:q]
    if query
      search = { name_or_tags_name_or_person_attributes_value_cont: query }
    end
    @search = Person.search(search)
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def set_company
    @company = current_person.try :company
  end
end
