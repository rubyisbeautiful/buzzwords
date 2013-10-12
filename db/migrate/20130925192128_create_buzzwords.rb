class CreateBuzzwords < ActiveRecord::Migration
  def change
    create_table :buzzwords do |t|
      t.string :word
      t.integer :votes, default: 1

      t.timestamps
    end
  end
end
