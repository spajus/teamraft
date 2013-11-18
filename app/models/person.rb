class Person < ActiveRecord::Base

  validates :company, presence: true
  validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :approver, class_name: 'Person'
  belongs_to :company
  belongs_to :reports_to, class_name: 'Person'

  has_many :person_attributes

  def approve_by(person)
    raise "#{person} (not admin) tried to approve #{self}" unless person.admin?
    self.approver = person
    self.joined_at = DateTime.now
  end

  def approved?
    self.joined_at.present?
  end

  def attribute_value(attribute_type)
    PersonAttribute.where(person: self, attribute_type: attribute_type).first.try :value
  end
end
