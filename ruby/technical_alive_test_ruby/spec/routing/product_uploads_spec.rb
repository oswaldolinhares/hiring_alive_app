# frozen_string_literal: true

require 'rails_helper'

describe 'product_uploads routes', type: :routing do
  it 'should route to new product_uploads' do
    expect(get('/product_uploads/new')).to route_to('product_uploads#new')
  end
end
