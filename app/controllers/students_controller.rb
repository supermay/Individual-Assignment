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

  def show
    @batch = Batch.find(params[:batch_id])
    @students = @batch.students
    @student = Student.find(params[:id])
    @evaluation = Evaluation.new
  end

  def edit
    @batch = Batch.find(params[:batch_id])
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to batch_path(params[:batch_id]), notice: "Student updated"
    else
      redirect_to batch_path(params[:batch_id]), notice: "Student not updated"
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to batch_path(params[:batch_id]), notice: "Student removed."
  end

  private
  def student_params
    params.require(:student).permit(:first_name,:last_name,:picture)
  end
end
