class AddForeignKeyToPerson < ActiveRecord::Migration[5.1]
  def change
	#remove_column :people, :house_id
	add_foreign_key :people, :houses
  end
end
