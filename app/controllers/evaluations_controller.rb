class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @evaluation = Evaluation.create(evaluation_params.merge(student_id: params[:student_id]))
    if @evaluation.save
      redirect_to batch_path(params[:batch_id]), notice: "Evaluation added."
    else
      redirect_to batch_student_path(params[:batch_id],params[:student_id]), notice: "Please fill in all information."
    end
  end

  private
  def evaluation_params
    params.require(:evaluation).permit(:time,:color,:remark)
  end

end
