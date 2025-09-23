class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.float :weight
      t.float :height
      t.text :nutrition_plan
      t.text :clinical_history
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
