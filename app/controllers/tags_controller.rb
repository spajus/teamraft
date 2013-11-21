class TagsController < ApplicationController
  def show
    @tag = params[:tag_name]
    @tagged_people = Person.tagged_with(@tag)
  end
end
