class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :status, default: ""
      t.integer :cohort_id, null: false
      t.integer :team_id
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
