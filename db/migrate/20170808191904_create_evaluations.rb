class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.date :time
      t.string :color
      t.text :remark
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
