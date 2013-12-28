class CompanyController < ApplicationController

  before_filter :verify_admin, only: [:edit, :update]

  def show
    if @company.people.count == 1
      flash.now[:notice] = "Tip: Create some #{view_context.link_to 'Attribute types', attribute_types_path} and then #{view_context.link_to 'Add or Invite your collegues', person_register_path}".html_safe
    end
  end

  def edit
  end

  def update
    params[:company].reverse_merge!(allow_signup: 0, auto_approve: 0)
    @company.update_attributes(params.require(:company)
                                     .permit(:name, :allow_signup, :auto_approve))
    flash[:notice] = 'Updated'
    redirect_to action: :edit
  end
end
