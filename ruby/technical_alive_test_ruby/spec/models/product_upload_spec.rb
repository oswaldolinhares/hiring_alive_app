# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductUpload, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:file) }
    it { is_expected.to validate_attached_of(:file) }
    it { is_expected.to validate_content_type_of(:file).allowing('text/csv') }
  end
end
