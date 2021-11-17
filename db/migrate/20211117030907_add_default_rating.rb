class AddDefaultRating < ActiveRecord::Migration[6.1]
  def up
    execute "UPDATE foods SET rating = 5;"
    execute "ALTER TABLE foods ALTER COLUMN rating SET DEFAULT 5;"
  end

  def down
    execute "ALTER TABLE foods ALTER rating DROP DEFAULT;"
  end
end
