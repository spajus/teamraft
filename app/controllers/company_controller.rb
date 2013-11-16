class CompanyController < ApplicationController
  def show
    @company = current_person.company
  end
end
