# frozen_string_literal: true

# ProductsController
class ProductsController < ApplicationController
  def index
    @products = filtered_products
  end

  private

  def filtered_products
    Product.where(sanitized_params).order(created_at: :desc)
  end

  def sanitized_params
    params.permit(permitted_attributes).reject { |_, value| value.empty? }
  end

  def permitted_attributes
    %i[manufacturer model carrier_plan_type]
  end
end
