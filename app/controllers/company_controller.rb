class CompanyController < ApplicationController

  before_filter :authenticate_person!

  def show
    @company = current_person.company
  end
end
