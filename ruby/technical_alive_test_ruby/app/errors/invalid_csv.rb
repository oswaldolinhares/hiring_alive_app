# frozen_string_literal: true

# InvalidCsv
class InvalidCsv < StandardError
  def message
    'O arquivo CSV é inválido'
  end
end
