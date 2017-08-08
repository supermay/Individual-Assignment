class BatchesController < ApplicationController
  before_action :authenticate_user!

  def show
    @batches = current_user.batches
    @batch = Batch.new
  end

  def create
    @batch = current_user.batches.build(batch_params)
    @batch.save
    redirect_to root_path, notice: "New batch created!"
  end

  private
  def batch_params
    params.require(:batch).permit(:number,:start,:end)
  end

end
