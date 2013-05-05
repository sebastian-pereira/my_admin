class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :name, :null => false
      t.string :abbr, :limit => 20, :null => false
      t.integer :city_id, :null => false

      t.timestamps
    end

    execute "INSERT INTO universities (`name`, `abbr`, `city_id`) values ('Saint-Petersburg university', 'SPbGU', 1)"
    execute "INSERT INTO universities (`name`, `abbr`, `city_id`) values ('Moscow university', 'MGU', 2)"
    execute "INSERT INTO universities (`name`, `abbr`, `city_id`) values ('Saint-Petersburg Marine university', 'SPbGMTU', 1)"
  end
end
