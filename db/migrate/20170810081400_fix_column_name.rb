class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :batches, :start, :start_at
    rename_column :batches, :end, :end_at       
  end
end
