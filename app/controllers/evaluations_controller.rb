class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @evaluation = Evaluation.new(evaluation_params.merge(student_id: params[:student_id]))
    @current_student_all_evaluations = Evaluation.all.one_student_all_evaluations(@evaluation.student_id)
    @existing_evaluation_dates = @current_student_all_evaluations.map{ |evaluation| evaluation.time.to_s }

    if !@existing_evaluation_dates.include?(@evaluation.time.to_s)
      if @evaluation.save!
        if params[:commit] == 'Save'
          redirect_to batch_path(params[:batch_id]), notice: "Evaluation added."
        else
          @batch = Batch.find(params[:batch_id])
          @students = @batch.students.order(:id)
          @student = Student.find(params[:student_id])
          @index_of_student = @students.index(@student)
          if @index_of_student == @students.length - 1
            @index_next_student = 0
          else
            @index_next_student = @index_of_student + 1
          end
          redirect_to batch_student_path(params[:batch_id], @students[@index_next_student])
        end
      else
        flash[:alert] = "Please fill in all information."
        redirect_to batch_student_path(params[:batch_id],params[:student_id])
      end
    else
      flash[:alert] = "Evaluation of the day already exists!"
      redirect_to batch_student_path(params[:batch_id],params[:student_id])
    end


  end

  def update
    @batch = Batch.find(params[:batch_id])
    @student = Student.find(params[:student_id])
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update(evaluation_params)
      redirect_to batch_student_path(params[:batch_id],params[:student_id]), notice: "Evaluation updated"
    else
      redirect_to batch_student_path(params[:batch_id],params[:student_id]), notice: "Evaluation not updated"
    end
  end


  private
  def evaluation_params
    params.require(:evaluation).permit(:time,:color,:remark)
  end

end
