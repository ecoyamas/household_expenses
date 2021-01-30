require 'rails_helper'

RSpec.describe Income, type: :model do
  context 'valid' do
    it '有効である' do
      income = FactoryBot.build(:income)
      expect(income).to be_valid
    end
  end

  context 'invalid' do
    it '有効でない' do
      income = Income.new
      income.valid?
      expect(income.errors[:title]).to include("can't be blank")
      expect(income.errors[:salary]).to include("can't be blank")
      expect(income.errors[:salary_date]).to include("can't be blank")
    end
  end
end
