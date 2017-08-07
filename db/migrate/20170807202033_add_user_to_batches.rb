class AddUserToBatches < ActiveRecord::Migration[5.1]
  def change
    add_reference :batches, :user, foreign_key: true
  end
end
