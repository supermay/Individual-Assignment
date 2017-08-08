class StudentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @student = Student.create(student_params.merge(batch_id: params[:batch_id]))
    if @student.save
      redirect_to batch_path(params[:batch_id]), notice: "Student added."
    else
      redirect_to batch_path(params[:batch_id]), notice: "Please fill in all information."
    end
  end

  private
  def student_params
    params.require(:student).permit(:first_name,:last_name,:picture)
  end
end
