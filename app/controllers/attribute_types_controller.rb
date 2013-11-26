class AttributeTypesController < ApplicationController

  def index
    @attribute_types = @company.attribute_types
    @new_attribute_type = AttributeType.new

    @templates = AttributeType.where(company_id: 0)
  end

  def create
    params[:attribute_type].reverse_merge!(required: 0)
    @new_attribute_type = AttributeType.new(params.require(:attribute_type)
                                                  .permit(:attribute_name,
                                                          :attribute_type,
                                                          :description,
                                                          :required))
    @new_attribute_type.company = @company
    @new_attribute_type.sort_order = AttributeType.next_sort_order_for(@company)
    @new_attribute_type.save

    redirect_to attribute_types_path
  end

end
