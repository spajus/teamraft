class AttributeType < ActiveRecord::Base

  belongs_to :company

  TYPES = %w[Date Checkbox Text Number Email Phone]

  def self.next_sort_order_for(company)
    select("max(sort_order) as max_order").where(company: company).first.max_order || 0
  end
end
