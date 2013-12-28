class AttributeType < ActiveRecord::Base

  validates :icon, presence: true
  validates :attribute_name, presence: true
  validates :description, presence: true

  default_scope order 'sort_order asc'

  before_save :set_sort_order

  belongs_to :company
  has_many :person_attributes, dependent: :destroy

  TYPES = %w[Date Checkbox Text Number Email Phone]

  def self.change_sort_order(direction, attribute_type_id, company)
    attribute = AttributeType.where(company: company, id: attribute_type_id).first
    return unless attribute
    if direction == :up
      sort_condition = 'sort_order < ?'
      order_by = 'sort_order desc'
    else
      sort_condition = 'sort_order > ?'
      order_by = 'sort_order asc'
    end
    replacement = AttributeType.unscoped.where(company: company)
                                        .where(sort_condition, attribute.sort_order)
                                        .order(order_by)
                                        .limit(1)
                                        .first
    return unless replacement
    new_order = replacement.sort_order
    replacement.update_attribute(:sort_order, attribute.sort_order)
    attribute.update_attribute(:sort_order, new_order)
  end

  def self.next_sort_order_for(company_id)
    order = select("max(sort_order) as max_order").where(company_id: company_id).first.max_order || 0
    order + 1
  end

  private

  def set_sort_order
    self.sort_order ||= AttributeType.next_sort_order_for(self.company_id)
  end
end
