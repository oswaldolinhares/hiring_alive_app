# frozen_string_literal: true

# ProductUpload
class ProductUpload < ApplicationRecord
  has_one_attached :file
  validates :file, presence: true
  validates :file, attached: true,
                   content_type: { in: ['text/csv', 'application/vnd.ms-excel'],
                                   message: 'O arquivo não possui a extensão .csv' }
end
