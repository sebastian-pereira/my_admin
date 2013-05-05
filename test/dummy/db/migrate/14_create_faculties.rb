class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :name
      t.integer :university_id

      t.timestamps
    end

    execute "INSERT INTO faculties (`name`, `university_id`) values ('Math as physics', 1)"
    execute "INSERT INTO faculties (`name`, `university_id`) values ('Economic', 1)"
    execute "INSERT INTO faculties (`name`, `university_id`) values ('Ecologic', 1)"

    execute "INSERT INTO faculties (`name`, `university_id`) values ('Literature', 1)"
    execute "INSERT INTO faculties (`name`, `university_id`) values ('Russian', 1)"
  end
end
