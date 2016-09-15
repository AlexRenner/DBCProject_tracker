class UpdateRoundWithVotable < ActiveRecord::Migration[5.0]
  def change
    add_column :rounds, :votable, :boolean, default: false
  end
end
