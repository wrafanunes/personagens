class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :first_name
      t.string :last_name
      t.string :origin

      t.timestamps
    end
  end
end
