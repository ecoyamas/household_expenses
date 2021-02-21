require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do # rubocop:disable Metrics/BlockLength
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
    let(:expense) { create(:expense) }
    before { get :show, params: { id: expense.id } }

    it 'レスポンスが200となること' do
      expect(response.status).to eq 200
    end

    it 'indexテンプレートを表示すること' do
      expect(response).to render_template :show
    end

    it 'assigns @expense' do
      expect(assigns(:expense)).to eq expense
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
        post :create, params: { expense: attributes_for(:expense) }
        expect(response.status).to eq 302
      end

      it 'expenseが登録されること' do
        expect { post :create, params: { expense: attributes_for(:expense) } }.to change(Expense, :count).by(1)
      end
    end
  end

  describe 'GET #edit' do
    let(:expense) { create(:expense) }
    before { get :edit, params: { id: expense.id } }

    it 'レスポンスが200となること' do
      expect(response.status).to eq 200
    end

    it 'assigns @expense' do
      expect(assigns(:expense)).to eq expense
    end

    it 'renders the :edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    let!(:expense) { create(:expense) }
    let(:expenses_params) do
      {
        title: 'update title',
        price: 100,
        using_date: '2020-01-01'
      }
    end

    it 'saves updated expense' do
      expect do
        patch :update, params: { id: expense.id, expense: expenses_params }
      end.to change(Expense, :count).by(0)
    end

    it 'updates updated article' do
      patch :update, params: { id: expense.id, expense: expenses_params }
      expense.reload
      expect(expense.title).to eq expenses_params[:title]
      expect(expense.price).to eq expenses_params[:price]
      expect(expense.using_date).to eq expenses_params[:using_date].to_date
    end
  end

  describe 'DELETE #destroy' do
    let!(:expense) { create(:expense) }
    it 'deletes the article' do
      expect do
        delete :destroy, params: { id: expense.id }
      end.to change(Expense, :count).by(-1)
    end

    it 'redirects the :create template' do
      delete :destroy, params: { id: expense.id }
      expect(response).to redirect_to(expenses_path)
    end
  end
end
