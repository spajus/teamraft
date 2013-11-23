class PeopleController < ApplicationController

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.where(id: params[:id], company: @company).first
  end

  def update
    @person.update_attributes(params.require(:person).permit(:name, :email, :tag_list))
    @person.update_person_attributes(params.require(:person_attributes))
    flash.now[:notice] = 'Updated'
  end

  def me
    @person = current_person
    update if request.post?
  end

  def tags_list
    render json: Person.tag_counts_on(:tags).map(&:name)
  end
end
