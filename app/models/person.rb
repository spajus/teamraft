class Person < ActiveRecord::Base

  scope :ordered, order('name asc')

  acts_as_taggable

  validates :company, presence: true
  validates :name, presence: true
  validates_associated :person_attributes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :approver, class_name: 'Person'
  belongs_to :company
  belongs_to :reports_to, class_name: 'Person'

  has_many :person_attributes, dependent: :destroy, autosave: true

  def approve_by(person)
    raise "#{person} (not admin) tried to approve #{self}" unless person.admin?
    self.approver = person
    self.joined_at = DateTime.now
  end

  def approved?
    self.joined_at.present?
  end

  def attribute_value(attribute_type)
    attribute_instance(attribute_type).try :value
  end

  def attribute_instance(attribute_type)
    person_attributes.where(attribute_type: attribute_type,
                            deleted: false).first
  end

  def attribute_cached_instance(attribute_type)
    person_attributes.select { |a| a.attribute_type == attribute_type }.first
  end

  def to_param
    [id, name.parameterize].join('-')
  end

  def update_person_attributes(attribute_list)
    return unless attribute_list
    attribute_list.each do |type_id, value|
      PersonAttribute.update(self, type_id, value)
    end
  end
end
