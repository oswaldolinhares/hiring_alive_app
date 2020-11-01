# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  def manufacturers_to_select
    Product.distinct.pluck(:manufacturer).sort
  end

  def models_to_select
    Product.distinct.pluck(:model).sort
  end

  def carrier_plan_types_to_select
    Product.distinct.pluck(:carrier_plan_type).sort
  end
end