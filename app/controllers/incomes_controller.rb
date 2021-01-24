class IncomesController < ApplicationController
  def index
    @incomes = Income.all
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to incomes_path, notice: 'Success!'
    else
      render "new"
    end
  end

  private

  def income_params
    params.require(:income).permit(:title, :salary, :salary_date)
  end
end
