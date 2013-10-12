class CreateBuzzwordVotes < ActiveRecord::Migration
  def change
    create_table :buzzword_votes do |t|
      t.integer :buzzword_id

      t.timestamps
    end
  end
end
