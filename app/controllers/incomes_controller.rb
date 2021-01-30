class IncomesController < ApplicationController
  def index
    @incomes = Income.all
  end

  def show
    @income = Income.find(params[:id])
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to incomes_path, notice: 'Success!'
    else
      render 'new'
    end
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    income = Income.find(params[:id])
    income.update(income_params)
  end

  def destroy
    income = Income.find(params[:id])
    if income.destroy
      redirect_to incomes_path, notice: 'Success!'
    else
      redirect_to incomes_path, notice: 'Failed!'
    end
  end

  private

  def income_params
    params.require(:income).permit(:title, :salary, :salary_date)
  end
end
