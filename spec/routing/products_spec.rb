# frozen_string_literal: true

require 'rails_helper'

describe 'products routes', type: :routing do
  it 'should route to products index' do
    expect(get('/products')).to route_to('products#index')
  end
end
