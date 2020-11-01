# frozen_string_literal: true

# Product
class Product < ApplicationRecord
  enum carrier_plan_type: { pre: 'pre', pos: 'pos' }

  validates :manufacturer, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :carrier_plan_type, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
