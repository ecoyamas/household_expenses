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
end
