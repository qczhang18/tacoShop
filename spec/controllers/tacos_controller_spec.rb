require "rails_helper"

RSpec.describe TacosController, :type => :controller do
  describe "GET #index" do
    it "populates list of tacos" do
      taco = create_list(:taco, 10)
      get :index
      expect(assigns(:tacos)).to eq(taco)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new contact in the database" do
        expect{
          post :create, params:{taco: attributes_for(:taco) }
        }.to change(Taco, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect{
          post :create, params:{taco: { meat:"beef", rice:false, salsa:nil, pepper:true} }
        }.to_not change(Taco, :count)
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @taco = create(:taco)
    end

    it "deletes the taco" do
      expect{
        delete :destroy, params:{id: @taco}
      }.to change(Taco,:count).by(-1)
    end
  end
end
