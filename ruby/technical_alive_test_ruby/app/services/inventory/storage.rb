# frozen_string_literal: true

# Inventory::Storage
class Inventory::Storage
  def initialize(products)
    @products = products
  end

  def save
    raise InvalidCsv unless valid?

    products.shift
    Product.import(products)
  end

  private

  attr_reader :products

  def valid?
    products.each { |x| return false if x.value?(nil) }
  end
end
