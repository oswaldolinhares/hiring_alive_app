# frozen_string_literal: true

# ModelsController
class ModelsController < ApplicationController
  def index
    render json: models
  end

  private

  def models
    if manufacturer.blank?
      Product.distinct.pluck(:model).sort
    else
      Product.where(manufacturer: params[:manufacturer])
             .distinct.pluck(:model).sort
    end
  end

def manufacturer
  params[:manufacturer]
end
end