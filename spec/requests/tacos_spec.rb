require 'rails_helper'

RSpec.describe "Tacos", type: :request do
  before do
    @taco = Taco.create(meat: "Chicken", rice: true, salsa: false, pepper: false, notes: "Stuff")
  end

  describe 'GET /tacos/:id' do
    context 'with existing taco' do
      before { get "/tacos/#{@taco.id}"  }
      it "handles existing tao" do
        expect(response.status).to eq 200
      end
    end
  end

  # Destroy, Delete
  describe 'DELETE /tacos/:id' do
    context 'with existing data' do
      before do
        delete "/tacos/#{@taco.id}"
      end
      it "deletes the taco" do
        expect(response.status).to eq 204
      end
    end
  end

  # Post
  describe 'POST /tacos' do
    context 'with correct fields' do
      before do
        headers = {
          "ACCEPT" => "application/json",     # This is what Rails 4 accepts
          "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
        }
        post "/tacos", :params => { :taco => {:meat => "Beef", :rice=>false, :salsa=>true, :pepper=>false, :notes=>"good stuff"} }, :headers => headers
      end
      it "creates a Taco" do
        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(:created)
      end
    end
  end

end


  # describe "Tacos API" do
  #   it 'sends a list of tacos' do
  #     FactoryGirl.create_list(:taco, 10)
  #
  #     get '/tacos'
  #
  #     json = JSON.parse(response.body)
  #
  #     # test for the 200 status-code
  #     expect(response).to be_success
  #
  #     # check to make sure the right amount of messages are returned
  #     expect(json['tacos'].length).to eq(10)
  #   end
