class CreateAdminUsersAndRoles < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
      t.string :name, :limit => 50, :null => false
      t.string :surname, :limit => 50, :null => false
      t.string :email, :null => false
      t.string :password, :limit => 32, :null => false
      t.string :user_hash, :limit => 32, :null => false
      t.string :avatar
      t.integer :admin_user_role_id
      t.boolean :active, :default => 1
      t.boolean :trash, :default => 0

      t.timestamps
    end

    create_table :admin_user_roles do |t|
      t.string :name, :limit => 50
      t.string :alias, :limit => 20
      t.boolean :active, :default => 1
      t.boolean :trash, :default => 0

      t.timestamps
    end
    add_index :admin_user_roles, :alias, :unique => true

    add_index :admin_users, :email, :unique => true
    execute "ALTER TABLE admin_users ADD CONSTRAINT fk_role FOREIGN KEY (admin_user_role_id) REFERENCES admin_user_roles(id) ON DELETE RESTRICT ON UPDATE RESTRICT"
    execute "INSERT INTO admin_user_roles (`name`, `alias`, `active`) values ('superadmin', 'superadmin', 1)"
    execute "INSERT INTO admin_users (`name`, `admin_user_role_id`) values ('superadmin', 1)"
  end

  def down

    remove_index :admin_users, :email
    remove_index :admin_user_roles, :alias

    drop_table :admin_users
    drop_table :admin_user_roles

  end
end
