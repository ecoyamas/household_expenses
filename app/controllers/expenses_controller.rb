class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: 'Success!'
    else
      render 'new'
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    expense = Expense.find(params[:id])
    expense.update(expense_params)
  end

  def destroy
    expense = Expense.find(params[:id])
    if expense.destroy
      redirect_to expenses_path, notice: 'Success!'
    else
      redirect_to expenses_path, notice: 'Failed!'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :price, :using_date)
  end
end
