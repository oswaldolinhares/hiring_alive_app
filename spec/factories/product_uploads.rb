# frozen_string_literal: true

FactoryBot.define do
  factory :product_upload do
    file { fixture_file_upload(Rails.root.join('spec/files/input_valid.csv'), 'text/csv') }

    trait :input_invalid do
      file { fixture_file_upload(Rails.root.join('spec/files/input_invalid.csv'), 'text/csv') }
    end
  end
end
