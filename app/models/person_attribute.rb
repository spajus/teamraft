class PersonAttribute < ActiveRecord::Base
  belongs_to :person
  belongs_to :attribute_type

  def self.update(person, attr_type_id, value)
    attrib = person.person_attributes.where(attribute_type_id: attr_type_id).first_or_initialize
    if value.present?
      attrib.value = value
      attrib.deleted = false
      attrib.save
    elsif attrib.persisted?
      attrib.deleted = true
      attrib.save
    end
  end
end
