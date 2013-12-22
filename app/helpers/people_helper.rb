module PeopleHelper
  def person_attribute_form_value(attr_field, attr, person, bulk_update_person_id)
    if bulk_update_person_id.nil? || bulk_update_person_id == person.id
      attr.try(:value) || params[:person_attributes] && params[:person_attributes][attr_field.id.to_s]
    else
      attr.try(:value)
    end
  end
end
