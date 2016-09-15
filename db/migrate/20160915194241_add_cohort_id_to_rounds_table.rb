class AddCohortIdToRoundsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :rounds, :cohort_id, :integer, default: 1
  end
end
