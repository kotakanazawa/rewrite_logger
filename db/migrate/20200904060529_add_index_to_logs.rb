class AddIndexToLogs < ActiveRecord::Migration[6.0]
  def change
    add_index :logs, :created_at
  end
end
