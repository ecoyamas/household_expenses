class IncomesController < ApplicationController
  def index; end

  def new
    @income = Income.new
  end

  def create
    income = Income.new(income_params)
    income.save
  end

  private

  def income_params
    params.require(:income).permit(:title, :salary, :salary_date)
  end
end
