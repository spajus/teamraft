class PersonAttribute < ActiveRecord::Base
  belongs_to :person
  belongs_to :attribute_type
  validates :value, presence: true, if: 'attribute_type.required?'

  def self.update(person, attr_type_id, value)
    type_attributes = person.person_attributes.where(attribute_type_id: attr_type_id)
    attrib = type_attributes.first_or_initialize
    remove_duplicates(type_attributes, attrib)
    existing = person.person_attributes.select { |a| a.attribute_type_id == attr_type_id.to_i }.first
    if existing
      attrib = existing
    else
      person.person_attributes << attrib
    end
    attrib.value = value
    attrib.deleted = false
    attrib
  end

  def self.remove_duplicates(attributes, attribute)
    if attributes.length > 1 && attribute.id
      attributes.map { |a| a.destroy if a.id != attribute.id }
    end
  end
end
