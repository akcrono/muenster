class CompaniesController < ApplicationController

  def index
    @companies = Company.order(updated_at: :desc)
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:notice] = 'Saved!'
      redirect_to '/companies'
    else
      flash[:notice] = 'Invalid entry!'
      render :new
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:notice] = 'Saved!'
      redirect_to '/companies'
    else
      flash[:notice] = 'Invalid entry!'
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(:name, :description, :industry, :website, :location)
  end
end
