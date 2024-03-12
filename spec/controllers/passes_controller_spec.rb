# frozen_string_literal: true

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
    before do
      sign_in(user)
    end

    context 'with valid attributes' do
      let(:pass_attributes) { attributes_for(:pass) }
      subject { post :create, params: { pass: pass_attributes } }

      it 'creates new pass' do
        expect { subject }.to change(Pass, :count).by(1)
      end

      it 'render show view' do
        expect(subject).to redirect_to(assigns(:pass))
      end
    end

    context 'with invalid attributes' do
      let(:pass_attributes) { attributes_for(:pass, invalid_attribute: 'invalid value') }

      it 'does not create new pass' do
        expect { subject }.not_to change(Pass, :count)
      end

      it 'renders the new view' do
        is_expected.to render_template(:new)
      end
    end
  end

  describe 'PUT #update' do
    before do
      sign_in(user)
    end

    let(:pass) { create :pass, user: user }

    context 'with valid attributes' do
      it 'updates the pass' do
        put :update, params: { id: pass.id, pass: { visitor_firstname: 'New firstname' } }
        pass.reload
        expect(pass.visitor_firstname).to eq('New firstname')
      end

      it 'redirects to the updated pass' do
        put :update, params: { id: pass.id, pass: { visitor_firstname: 'New firstname' } }
        expect(response).to redirect_to(pass)
      end
    end
  end
end
