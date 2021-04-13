class CreateNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :numbers do |t|
      t.integer :entered_number
      t.string :converted_number

      t.timestamps
    end
  end
end
