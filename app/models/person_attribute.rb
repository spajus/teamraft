class PersonAttribute < ActiveRecord::Base
  belongs_to :person
  belongs_to :attribute_type
  validates :value, presence: true, if: 'attribute_type.required?'

  def self.update(person, attr_type_id, value)
    attrib = person.person_attributes.where(attribute_type_id: attr_type_id).first_or_initialize
    existing = person.person_attributes.select { |a| a.attribute_type_id == attr_type_id }.first
    if existing
      attrib = existing
    else
      person.person_attributes << attrib
    end
    attrib.value = value
    attrib.deleted = false
    attrib
  end
end
