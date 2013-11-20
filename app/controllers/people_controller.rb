class PeopleController < ApplicationController

  def show
    @person = Person.find(params[:id])
  end

  def tags_list
    render json: Person.tag_counts_on(:tags).map(&:name)
  end
end
