require 'rails_helper'

RSpec.describe IncomesController, type: :controller do # rubocop:disable Metrics/BlockLength
  describe '#index' do
    before { get :index }

    it 'レスポンスが200となること' do
      expect(response.status).to eq 200
    end

    it 'indexテンプレートを表示すること' do
      expect(response).to render_template :index
    end
  end

  describe '#show' do
    let(:income) { create(:income) }
    before { get :show, params: { id: income.id } }

    it 'レスポンスが200となること' do
      expect(response.status).to eq 200
    end

    it 'indexテンプレートを表示すること' do
      expect(response).to render_template :show
    end

    it 'assigns @income' do
      expect(assigns(:income)).to eq income
    end
  end

  describe 'Get #new' do
    before { get :new }

    it 'レスポンスが200となること' do
      expect(response.status).to eq 200
    end

    it 'newテンプレートを表示すること' do
      expect(response).to render_template :new
    end
  end

  describe 'Post #create' do
    context '有効なパラメータの場合' do
      it 'レスポンスが302となること' do
        post :create, params: { income: attributes_for(:income) }
        expect(response.status).to eq 302
      end

      it 'Incomeが登録されること' do
        expect { post :create, params: { income: attributes_for(:income) } }.to change(Income, :count).by(1)
      end
    end
  end

  describe 'GET #edit' do
    let(:income) { create(:income) }
    before { get :edit, params: { id: income.id } }

    it 'レスポンスが200となること' do
      expect(response.status).to eq 200
    end

    it 'assigns @income' do
      expect(assigns(:income)).to eq income
    end

    it 'renders the :edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let!(:income) { create(:income) }
    let(:incomes_params) do
      {
        title: 'update title',
        salary: 100,
        salary_date: '2020-01-01'
      }
    end

    it 'saves updated income' do
      expect do
        patch :update, params: { id: income.id, income: incomes_params }
      end.to change(Income, :count).by(0)
    end

    it 'updates updated article' do
      patch :update, params: { id: income.id, income: incomes_params }
      income.reload
      expect(income.title).to eq incomes_params[:title]
      expect(income.salary).to eq incomes_params[:salary]
      expect(income.salary_date).to eq incomes_params[:salary_date].to_date
    end
  end

  describe 'DELETE #destroy' do
    let!(:income) { create(:income) }
    it 'deletes the article' do
      expect do
        delete :destroy, params: { id: income.id }
      end.to change(Income, :count).by(-1)
    end

    it 'redirects the :create template' do
      delete :destroy, params: { id: income.id }
      expect(response).to redirect_to(incomes_path)
    end
  end
end
