class BatchesController < ApplicationController
  before_action :authenticate_user!

  def show
    @batches = current_user.batches
  end

end
