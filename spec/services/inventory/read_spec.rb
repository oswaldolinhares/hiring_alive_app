# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inventory::Read, type: :service do
  let(:file) { create(:product_upload).file }

  describe '#products' do
    it 'returns the content from csv' do
      keys = %i[manufacturer model color carrier_plan_type quantity price]

      inventory = Inventory::Read.new(file)
      products = inventory.products

      products.each { |hash| expect(hash.keys).to eq(keys) }
    end
  end
end
