# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

spajus = Person.where(email: 'tomas.varaneckas@gmail.com').first
spajus.update_attribute(:ninja, true) if spajus

def add_attribute_type(params)
  attr = AttributeType.where(company_id: 0,
                             attribute_name: params[:attribute_name]).first_or_initialize
  attr.update_attributes(params)
end

add_attribute_type(
  icon: 'phone',
  attribute_name: 'Phone',
  attribute_type: 'Phone',
  description: 'Mobile phone number',
  required: true,
)

add_attribute_type(
  icon: 'home',
  attribute_name: 'Address',
  attribute_type: 'Text',
  description: 'Home address',
  required: false,
)

add_attribute_type(
  icon: 'star',
  attribute_name: 'Title',
  attribute_type: 'Text',
  description: 'Effective title',
  required: true,
)

