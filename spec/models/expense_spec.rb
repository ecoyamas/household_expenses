require 'rails_helper'

RSpec.describe Expense, type: :model do
  context 'valid' do
    it '有効である' do
      expense = FactoryBot.build(:expense)
      expect(expense).to be_valid
    end
  end

  context 'invalid' do
    it '有効でない' do
      expense = Expense.new
      expense.valid?
      expect(expense.errors[:title]).to include("can't be blank")
      expect(expense.errors[:price]).to include("can't be blank")
      expect(expense.errors[:using_date]).to include("can't be blank")
    end
  end
end
