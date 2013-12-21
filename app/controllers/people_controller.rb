class PeopleController < ApplicationController

  def index
    if params[:q]
      search = { name_or_tags_name_or_person_attributes_value_cont: params[:q] }
      @people = Person.where(company: @company).search(search).result(distinct: true)
    else
      @people = @company.people
    end
  end


  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.where(id: params[:id], company: @company).first
  end

  def update
    @person.update_attributes(params.require(:person).permit(:name, :email, :tag_list))
    @person.update_person_attributes(params[:person_attributes])
    if @person.valid?
      flash.now[:notice] = 'Updated'
    end
  end

  def me
    @person = current_person
    update if request.post?
  end

  def tags_list
    render json: Person.tag_counts_on(:tags).map(&:name)
  end
end
