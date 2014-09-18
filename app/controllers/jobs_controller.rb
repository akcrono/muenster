class JobsController < ApplicationController

  def index
    @jobs = Job.search(params[:search])
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "Job created"
      redirect_to jobs_path
    else
      flash[:notice] = "Invalid entry"
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Upgrade complete!"
      redirect_to "/jobs/#{params[:id]}"
    else
      flash[:notice] = "Invalid entry"
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to "/jobs"

  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :company_id)
  end
end
