class CreateProductUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :product_uploads do |t|

      t.timestamps
    end
  end
end
