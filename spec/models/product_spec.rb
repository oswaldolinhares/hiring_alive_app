# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:manufacturer) }
    it { is_expected.to validate_presence_of(:model) }
    it { is_expected.to validate_presence_of(:color) }
    it { is_expected.to validate_presence_of(:carrier_plan_type) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:price) }
  end
end
