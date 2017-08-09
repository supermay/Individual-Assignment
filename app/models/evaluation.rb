class Evaluation < ApplicationRecord
  belongs_to :student

  def self.get_latest_result(student_id)
    results = Evaluation.all.select{ |evaluation| student_id == evaluation.student_id }
    if results == []
      return []
    else
      results.sort{ |a,b| b.time - a.time }.first
    end
  end

  def self.get_latest_results_for_batch(students_ids)
    evaluations = []
    # for each student in the batch, you get all of their result.
    for id in students_ids do
      evaluations += Evaluation.all.select{ |evaluation| id == evaluation.student_id }
    end
    # order all evaluations for this batch and get the latest time
    if evaluations == []
      return []
    else
      latest_time = evaluations.sort{ |a,b| b.time - a.time }.first.time
      latest_results = evaluations.select{ |evaluation| latest_time == evaluation.time }
    end
  end

  def self.order_by_time
    order(time: :desc)
  end

  def self.one_student_all_evaluations(student_id)
    select { |evaluation| student_id == evaluation.student_id }
  end

end
