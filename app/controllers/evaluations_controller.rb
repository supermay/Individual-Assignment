class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @evaluation = Evaluation.create(evaluation_params.merge(student_id: params[:student_id]))
    if @evaluation.save
      if params[:commit] == 'Save'
        redirect_to batch_path(params[:batch_id]), notice: "Evaluation added."
      else
        @batch = Batch.find(params[:batch_id])
        @students = @batch.students
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
      redirect_to batch_student_path(params[:batch_id],params[:student_id]), notice: "Please fill in all information."
    end
  end

  private
  def evaluation_params
    params.require(:evaluation).permit(:time,:color,:remark)
  end

end
