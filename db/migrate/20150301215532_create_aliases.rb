class CreateAliases < ActiveRecord::Migration
  def change
    create_table :aliases do |t|
      t.string :original_url
      t.string :lengthened_url

      t.timestamps null: false
    end
  end
end
