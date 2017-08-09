class BatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @batches = current_user.batches
    @batches = @batches.search(params[:number])
    @batch = Batch.new
  end

  def show
    @batch = Batch.find(params[:id])
    @all_students_of_this_batch = @batch.students
    # *******************************************************
    # get this idea from rails console
    @students_ids = @all_students_of_this_batch.ids
    # removed @evaluations = Evaluation.all
    @latest_results = Evaluation.all.get_latest_results_for_batch(@students_ids)
    # get the separate array of latest evaluations with different colors
    # *******************************************************
    @green_evaluations = @latest_results.select{ |evaluation| 'GREEN' == evaluation.color }
    @yellow_evaluations = @latest_results.select{ |evaluation| 'YELLOW' == evaluation.color }
    @red_evaluations = @latest_results.select{ |evaluation| 'RED' == evaluation.color }
    # get the selection array
    @selection_array = []
    # put green evaluations once
    @selection_array << @green_evaluations
    # put yellow evaluations twice
    @selection_array << @yellow_evaluations
    @selection_array << @yellow_evaluations
    # put red evaluations three times
    @selection_array << @red_evaluations
    @selection_array << @red_evaluations
    @selection_array << @red_evaluations
    # get the random student
    @random_student_id = @selection_array.sample.sample.student_id
    @random_student = Student.find(@random_student_id)
    # filter
    # *******************************************************
    if params[:color].present?
      if params[:color] == "GREEN"
        @green_students_ids = @green_evaluations.map { |evaluation| evaluation.student_id }
        @students = []
        for each in @green_students_ids
          @students += @all_students_of_this_batch.select{ |student| each == student.id }
        end
      elsif params[:color] == "YELLOW"
        @yellow_students_ids = @yellow_evaluations.map { |evaluation| evaluation.student_id }
        @students = []
        for each in @yellow_students_ids
          @students += @all_students_of_this_batch.select{ |student| each == student.id }
        end
      elsif params[:color] == "RED"
        @red_students_ids = @red_evaluations.map { |evaluation| evaluation.student_id }
        @students = []
        for each in @red_students_ids
          @students += @all_students_of_this_batch.select{ |student| each == student.id }
        end
      end
    else
      @students = @all_students_of_this_batch
    end
  end

  def create
    @batch = current_user.batches.build(batch_params)
    if @batch.save
      redirect_to root_path, notice: "New batch created!"
    else
      redirect_to root_path, notice: "You need to fill in all information!"
    end
  end

  private
  def batch_params
    params.require(:batch).permit(:number,:start,:end)
  end

end
