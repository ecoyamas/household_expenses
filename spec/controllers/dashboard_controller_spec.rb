require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  describe '#index' do
    before { get :index }

    it 'レスポンスが200となること' do
      expect(response.status).to eq 200
    end

    it 'indexテンプレートを表示すること' do
      expect(response).to render_template :index
    end
  end
end
