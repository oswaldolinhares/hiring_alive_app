# frozen_string_literal: true

require 'rails_helper'

feature 'Product upload', type: :feature do
  before(:each) do
    visit root_path
  end

  context 'when upload is valid' do
    scenario 'shows success message on products page' do
      upload_csv('spec/files/input_valid.csv')
      expect(page).to have_current_path(products_path)
      expect(page).to have_content('Upload realizado com Sucesso!')
    end
  end

  context 'when upload is invalid' do
    scenario 'shows success message on products page' do
      upload_csv('spec/files/input_invalid.csv')
      expect(page).to have_current_path(new_product_upload_path)
      expect(page).to have_content('O arquivo CSV é inválido')
    end
  end

  def upload_csv(filepath)
    find('.file-input').click
    attach_file('product_upload_file', filepath)
    find('.button').click
  end
end
