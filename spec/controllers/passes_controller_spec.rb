require 'rails_helper'

RSpec.describe PassesController, type: :controller do
  describe 'GET #index' do
    let(:passes) { create_list :pass, 3 }

    before { get :index }

    context 'required output per page' do
      it 'render to index template' do
        is_expected.to render_template :index
      end
      it 'instance variable passes includes only passes' do
        expect(assigns(:passes)).to match_array(passes)
      end
    end
  end

  describe 'GET #show' do
    let(:pass) { create :pass }

    subject { get :show, params: { id: pass.id } }

    context 'show pass' do
      it 'render to show template' do
        is_expected.to render_template :show
      end

    end
  end

end
