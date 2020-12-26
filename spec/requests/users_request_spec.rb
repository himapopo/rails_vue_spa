require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "#index" do
    before do
      create(:taiki)
      create(:nattu)
      get '/users'
    end
    it "全てのユーザー情報をjsonで返す" do
      json = JSON.parse(response.body)
      expect(json['data'].length).to eq 2
      expect(json['data'][0]['name']).to eq "nattu"
    end

    it "ステータスコード200を返す" do
      expect(response.status).to eq 200
    end
  end
end
