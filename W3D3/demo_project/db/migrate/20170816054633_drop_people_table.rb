class DropPeopleTable < ActiveRecord::Migration[5.1]
  def change
	drop_table :people
  end

	def down
		raise ActiveRecord::IrreversibleMigration
	end
end
