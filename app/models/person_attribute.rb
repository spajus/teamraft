class PersonAttribute < ActiveRecord::Base
  belongs_to :person
  belongs_to :attribute_type
end
