require 'rails_helper'

RSpec.describe PassesController, type: :controller do
  describe 'GET #index' do
    let(:passes) { create_list :pass, 3 }

    before { get :index }

    context 'required output per page' do
      it 'render to index template' do
        expect(response).to render_template(:index)
      end
      it 'instance variable passes includes only passes' do
        expect(assigns(:passes)).to match_array(passes)
      end
    end

  end
end
