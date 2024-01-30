require 'rails_helper'

RSpec.describe PassesController, type: :controller do

  let!(:user) { create :user }

  describe 'GET #index' do
    let(:passes) { create_list :pass, 3, user: user }

    before { get :index }

    context 'required output per page' do
      it 'render to index template' do
        sign_in(user)
        is_expected.to render_template :index
      end
      it 'instance variable passes includes only passes' do
        expect(assigns(:passes)).to match_array(passes)
      end
    end
  end

  describe 'GET #show' do
    let(:pass)  { create :pass, user: user }

    subject { get :show, params: { id: pass.id } }

    context 'show pass' do
      it 'render to show template' do
        sign_in(user)
        is_expected.to render_template :show
      end
    end
  end

  describe 'POST #create' do
    let(:pass_attributes) { attributes_for(:pass) }
    subject { post :create, params: { pass: pass_attributes } }

    context 'with valid attributes' do
      it 'creates new pass' do
        sign_in(user)
        expect { subject }.to change(Pass, :count).by(1)
      end

      it 'render show view' do
        sign_in(user)
        expect(subject).to redirect_to(assigns(:pass))
      end
    end

  end
end
