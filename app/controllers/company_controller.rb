class CompanyController < ApplicationController

  before_filter :authenticate_person!

  def show
  end

  def edit
  end

  def update
    params[:company].reverse_merge!(allow_signup: 0, auto_approve: 0)
    @company.update_attributes(params.require(:company).permit(:name, :allow_signup, :auto_approve))
    flash[:notice] = 'Updated'
    redirect_to action: :edit
  end
end
