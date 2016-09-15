class UpdateCohortWithPitchable < ActiveRecord::Migration[5.0]
  def change
    add_column :cohorts, :pitchable, :boolean, default: false
  end
end
