class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :type
      t.integer :level
      t.integer :hours_of_next_evolution
      t.string :before_evolution_monster
      t.integer :luck

      t.timestamps
    end
  end
end
