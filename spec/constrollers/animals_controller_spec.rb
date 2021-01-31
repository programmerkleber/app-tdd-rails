require 'rails_helper'

RSpec.describe AnimalsController, type: :controller do
  # ou Context
  describe "GET /index" do
    # eu espero...
    it "renders a successful response" do
      get :index
      expect(response).to be_successful
      expect(response).to have_http_status 200
      # expect(response).to render_template :show
    end

    it 'array empty' do
      get :index
      expect(assigns(:animals)).to be_empty
    end

    it 'have one animal' do
      create(:animal)
      get :index
      expect(assigns(:animals)).to_not be_empty
    end
  end

  describe 'GET /show' do

    # variaves para eu usar: let
    let(:animal) { create(:animal) }

    it 'should success and render to show page' do
      get :show, params: { id: animal.id }
      expect(response).to have_http_status 200
      expect(response).to render_template :show
    end

    it 'where have id' do
      get :show, params: { id: animal.id }
      expect(assigns(:animal)).to be_a(Animal) # saber se é do tipo Animal
      expect(assigns(:animal)).to eq(animal) # saber se é igual a let[animal]
    end
  end

  describe "GET /new" do
    it 'should success and render to new page' do
      get :new
      expect(response).to have_http_status 200
      expect(response).to render_template :new
    end

    it 'should new post' do
      get :new
      expect(assigns(:animal)).to be_a Animal
      expect(assigns(:animal)).to be_a_new Animal # verifica se é um novo registro
    end
  end

  describe "POST /create" do
    let!(:params) {
      { name: 'Gato', type_animal: 'mamifero' }
    }

    # caminho feliz
    it 'should create a new animal' do
      post :create, params: { animal: params }
      expect(flash[:notice]).to eq('Animal was successfully created.')
      expect(response).to redirect_to action: :show, id: assigns(:animal).id
    end

    # caminho mau
    it 'should not create a new animal' do
      params = { name: 'galinha' }
      post :create, params: { animal: params }
      expect(response).to render_template :new
    end
  end

  describe "PUT #update" do
    let!(:animal) { create(:animal) }

    # caminho feliz
    it 'should update animal info' do
      params = { name: 'Update name to animal' }

      put :update, params: { id: animal.id, animal: params }
      animal.reload

      expect(animal.name).to eq(params[:name])
      expect(flash[:notice]).to eq 'Animal was successfully updated.'
      expect(response).to redirect_to action: :show, id: assigns(:animal).id
    end

    # caminho mau
    it 'should not update animal info' do
      params = { name: nil }

      put :update, params: { id: animal.id, animal: params }

      expect(response).to render_template :edit
    end
  end

  describe 'GET #edit' do
    let!(:animal) { create(:animal) }

    it 'should success and render edit page' do
      get :edit, params: { id: animal.id }
      expect(response).to render_template :edit
      expect(assigns(:animal)).to be_a Animal
    end
  end

  describe 'DELETE #destroy' do
    let!(:animal) { create(:animal) }

    it 'should delete animal' do
      delete :destroy, params: { id: animal.id }

      expect(flash[:notice]).to eq('Animal was successfully destroyed.')
      expect(response).to redirect_to action: :index
    end
  end
end
