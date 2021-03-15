class CreateAlternatives < ActiveRecord::Migration[6.1]
  def change
    create_table :alternatives do |t|
      t.integer :votes
      t.references :survey, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
