class Person < ActiveRecord::Base

  validates :company, presence: true
  validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  belongs_to :approver, class_name: 'Person'
  belongs_to :company

  def approve_by(person)
    raise "#{person} (not admin) tried to approve #{self}" unless person.admin?
    self.approver = person
    self.joined_at = DateTime.now
  end
end
