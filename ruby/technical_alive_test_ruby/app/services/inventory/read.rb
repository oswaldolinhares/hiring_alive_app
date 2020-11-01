# frozen_string_literal: true

# Inventory::Read
class Inventory::Read
  attr_reader :products

  def initialize(file)
    @filepath = ActiveStorage::Blob.service.path_for(file.key)
    @file = Roo::CSV.new(filepath)
    @products = []

    process_file
  end

  private

  attr_reader :file, :filepath

  def process_file
    file.each(attributes) { |x| products << x }
  end

  def attributes
    {
      manufacturer: 'manufacturer',
      model: 'model',
      color: 'color',
      carrier_plan_type: 'carrier_plan_type',
      quantity: 'quantity',
      price: 'price'
    }
  end
end
