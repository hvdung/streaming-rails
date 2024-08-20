class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :url

      t.timestamps
    end
  end
end
