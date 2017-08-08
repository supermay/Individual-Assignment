class BatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @batches = current_user.batches
    @batch = Batch.new
  end

  def show
    @batch = Batch.find(params[:id])
    @students = @batch.students
    # get this idea from rails console
    @students_ids = @students.ids
    # removed @evaluations = Evaluation.all
    @latest_results = Evaluation.all.get_latest_results_for_batch(@students_ids)
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
