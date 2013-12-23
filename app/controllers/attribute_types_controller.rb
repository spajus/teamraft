class AttributeTypesController < ApplicationController

  before_filter :verify_admin

  def index
    @attribute_types = @company.attribute_types
    @new_attribute_type = AttributeType.new

    @templates = AttributeType.where(company_id: 0)
  end

  def up
    AttributeType.change_sort_order(:up, params[:attribute_type_id], @company)
    redirect_to attribute_types_path
  end

  def down
    AttributeType.change_sort_order(:down, params[:attribute_type_id], @company)
    redirect_to attribute_types_path
  end

  def create
    params[:attribute_type].reverse_merge!(required: 0)
    @new_attribute_type = AttributeType.new(params.require(:attribute_type)
                                                  .permit(:attribute_name,
                                                          :attribute_type,
                                                          :description,
                                                          :icon,
                                                          :required))
    @new_attribute_type.company = @company
    @new_attribute_type.save

    redirect_to attribute_types_path
  end

  def destroy
    AttributeType.where(company: @company, id: params[:id]).destroy_all
    redirect_to attribute_types_path
  end

end
