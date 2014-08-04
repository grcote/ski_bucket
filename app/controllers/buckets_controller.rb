class BucketsController < ApplicationController
  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = Bucket.create(bucket_strong_params.merge(user_id: current_user.id))

    if @bucket.errors.messages.empty?
      flash[:success] = 'Bucket successfully created'
      redirect_to buckets_path
    else
      render :new
    end
  end

  def index
    @buckets = Bucket.where(user_id: current_user.id)
  end

  def show
    @bucket = Bucket.find(params[:id])
  end

  def edit
    @bucket = Bucket.find(params[:id])
  end

  def update
    @bucket = Bucket.find(params[:id])
    @bucket.update_attributes(bucket_strong_params)
    flash[:success] = 'Bucket updated'
    redirect_to bucket_path(@bucket)
  end

  def destroy
    bucket = Bucket.find(params[:id])
    bucket.delete
    flash[:success] = 'Bucket deleted'
    redirect_to buckets_path
  end

  private

  def bucket_strong_params
    params.require(:bucket).permit(
      :name,
      :description
    )
  end

end
