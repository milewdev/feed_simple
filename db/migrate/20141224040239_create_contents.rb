class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :json

      t.timestamps null: false
    end
  end
end
