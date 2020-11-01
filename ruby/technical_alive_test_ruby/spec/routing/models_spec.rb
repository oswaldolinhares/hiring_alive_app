# frozen_string_literal: true

require 'rails_helper'

describe 'models routes', type: :routing do
  it 'should route to models index' do
    expect(get('/models')).to route_to('models#index', format: :json)
  end
end
