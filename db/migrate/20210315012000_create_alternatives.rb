class CreateAlternatives < ActiveRecord::Migration[6.1]
  def change
    create_table :alternatives do |t|
      t.integer :votes, null: false, default: 0
      t.references :survey, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
