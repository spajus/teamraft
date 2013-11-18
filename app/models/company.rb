class Company < ActiveRecord::Base
  validates :name, presence: true
  has_many :people
  has_many :attribute_types
end
