class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.string :alias
      t.string :announce
      t.string :description
      t.integer :user_id

      t.timestamps
    end

    execute "INSERT INTO `albums` (`id`, `name`, `alias`, `announce`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
      (1, 'qweqwe', 'qweqwe', '', '', 3, '2013-01-13 16:38:50', '2013-01-13 16:38:50'),
      (2, 'ОЛОЛО', 'OLOLO', 'ololo announce', 'ololo description', 3, '2013-01-13 16:39:12', '2013-01-13 16:39:12'),
      (3, 'Тестовый Тестовый Тестовый', 'Testovyy', 'Тестовый анонс', 'Тестовое описание', 3, '2013-01-14 19:51:40', '2013-01-14 19:51:40'),
      (4, 'тест', 'test', '', '', 43, '2013-02-16 21:45:44', '2013-02-16 21:45:44')";
  end
end
