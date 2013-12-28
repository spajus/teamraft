class PeopleController < ApplicationController

  before_filter :verify_admin, only: [:bulk_edit, :bulk_update, :destroy]

  def index
    params.delete(:q) if params[:q] && params[:q].length < 3
    if params[:q]
      search = { name_or_tags_name_or_person_attributes_value_cont: params[:q] }
      @people = Person.ordered.where(company: @company).search(search).result(distinct: true)
    else
      @people = @company.people.order('name asc')
    end
  end

  def bulk_edit
    index
    @people = @people.page(params[:page]).per(10)
  end

  def bulk_update
    bulk_edit
    # Errors appear on list when we use same object
    person = @people.select { |p| p.id == params[:person_id].to_i }.first
    @bulk_update_person_id = person.id
    new_attributes = params.require(:person).permit(:name, :email, :tag_list, :admin)
    new_attributes[:admin] ||= false unless person == current_person
    person.update_attributes(new_attributes)
    person.update_person_attributes(params[:person_attributes])
    if person.valid?
      person.save
      flash.now[:notice] = 'Updated'
    else
      flash.now[:alert] = "Could not update"
    end
    render :bulk_edit
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = find_person
    @form_path = person_path(@person)
    @form_method = :put
    render :me
  end

  def destroy
    person = find_person
    if person
      person.destroy
      flash[:notice] = "#{person.name} removed from #{@company.name}"
    end
    redirect_to company_path
  end

  def update
    @person ||= find_person
    unless (@person == current_person) || current_person.admin?
      return redirect_to company_path
    end
    permit_attributes = [:name, :email, :photo, :tag_list]
    permit_attributes << :admin if current_person.admin?
    new_attributes = params.require(:person).permit(*permit_attributes)
    if current_person != @person
      new_attributes[:admin] ||= false if current_person.admin?
    end
    @person.update_attributes(new_attributes)
    @person.update_person_attributes(params[:person_attributes])
    if @person.valid?
      @person.save
      flash.now[:notice] = 'Updated'
    end
    render :show if params[:action] == 'update'
  end

  def me
    @person = current_person
    update if request.post?
  end

  def tags_list
    render json: Person.where(company: @company).tag_counts_on(:tags).map(&:name)
  end
end
