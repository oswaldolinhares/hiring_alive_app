# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inventory::Storage, type: :service do
  let(:valid_file) { create(:product_upload).file }
  let(:invalid_file) { create(:product_upload, :input_invalid).file }

  describe '#save' do
    it 'save products in database' do
      products = Inventory::Read.new(valid_file).products

      storage = Inventory::Storage.new(products)
      storage.save

      expect(Product.all.size).to eq(products.size)

      column_names = {
        manufacturer: 'manufacturer',
        model: 'model',
        color: 'color',
        carrier_plan_type: 'carrier_plan_type',
        quantity: 'quantity',
        price: 'price'
      }

      expect(Product.first).to_not eq(column_names)
    end
  end

  context 'when is a invalid file' do
    it 'raises an InvalidCsv exception' do
      products = Inventory::Read.new(invalid_file).products

      storage = Inventory::Storage.new(products)

      expect { storage.save }.to raise_error(InvalidCsv, 'O arquivo CSV é inválido')
    end
  end
end
