class CompanyController < ApplicationController

  before_filter :authenticate_person!

  def show
  end

  def edit
  end

  def update
    @company.update_attributes(params.require(:company).permit(:name))
    flash[:notice] = 'Updated'
    redirect_to action: :edit
  end
end
