class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
<<<<<<< HEAD
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :email, null: false
    	t.string :password_hash, null: false
    	t.boolean :teacher, default: false
    	t.integer :cohort_id
    	t.integer :team_id

    	t.timestamps
    end
  end
end
