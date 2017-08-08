class AddDefaultToEvaluation < ActiveRecord::Migration[5.1]
  def change
    change_column_default :evaluations, :time, Date.today
  end
end
