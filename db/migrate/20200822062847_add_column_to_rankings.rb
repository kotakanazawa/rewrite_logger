class AddColumnToRankings < ActiveRecord::Migration[6.0]
  def change
    add_column :rankings, :ranked_on, :date
  end
end
