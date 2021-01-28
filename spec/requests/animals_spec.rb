require 'rails_helper'

RSpec.describe "/animals", type: :request do
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # describe "GET /index" do
  #   it "renders a successful response" do
  #     Animal.create! valid_attributes
  #     get animals_url
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET /show" do
  #   it "renders a successful response" do
  #     animal = Animal.create! valid_attributes
  #     get animal_url(animal)
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET /new" do
  #   it "renders a successful response" do
  #     get new_animal_url
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET /edit" do
  #   it "render a successful response" do
  #     animal = Animal.create! valid_attributes
  #     get edit_animal_url(animal)
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Animal" do
  #       expect {
  #         post animals_url, params: { animal: valid_attributes }
  #       }.to change(Animal, :count).by(1)
  #     end
  #
  #     it "redirects to the created animal" do
  #       post animals_url, params: { animal: valid_attributes }
  #       expect(response).to redirect_to(animal_url(Animal.last))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "does not create a new Animal" do
  #       expect {
  #         post animals_url, params: { animal: invalid_attributes }
  #       }.to change(Animal, :count).by(0)
  #     end
  #
  #     it "renders a successful response (i.e. to display the 'new' template)" do
  #       post animals_url, params: { animal: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested animal" do
  #       animal = Animal.create! valid_attributes
  #       patch animal_url(animal), params: { animal: new_attributes }
  #       animal.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the animal" do
  #       animal = Animal.create! valid_attributes
  #       patch animal_url(animal), params: { animal: new_attributes }
  #       animal.reload
  #       expect(response).to redirect_to(animal_url(animal))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "renders a successful response (i.e. to display the 'edit' template)" do
  #       animal = Animal.create! valid_attributes
  #       patch animal_url(animal), params: { animal: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "DELETE /destroy" do
  #   it "destroys the requested animal" do
  #     animal = Animal.create! valid_attributes
  #     expect {
  #       delete animal_url(animal)
  #     }.to change(Animal, :count).by(-1)
  #   end
  #
  #   it "redirects to the animals list" do
  #     animal = Animal.create! valid_attributes
  #     delete animal_url(animal)
  #     expect(response).to redirect_to(animals_url)
  #   end
  # end

  describe "GET /index" do
    # eu espero...
    it "renders a successful response" do
      get animals_url
      expect(response).to be_successful
      expect(response).to have_http_status 200
      # expect(response).to render_template :show
    end

    it 'array empty' do
      get animals_url
      expect(assigns(:animals)).to be_empty
    end

    it 'have one animal' do
      create(:animal)
      get animals_url
      expect(assigns(:animals)).to_not be_empty
    end
  end

  describe 'GET /show' do

  end
end
