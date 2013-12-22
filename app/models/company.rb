class Company < ActiveRecord::Base
  validates :name, presence: true
  has_many :people
  has_many :attribute_types

  def big?
    people.count > 50
  end
end
