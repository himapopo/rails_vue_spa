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

  describe "#create" do
    context "成功時" do
      before do
        post "/users", params: { user: attributes_for(:taiki) }
        @json = JSON.parse(response.body)
      end
      it "作成したユーザー情報をjsonで返す" do
        expect(@json['data']['name']).to eq "taiki"
      end
      
      it "ステータスコード200を返す" do
        expect(response.status).to eq 200
      end

      it "ログインする" do
        expect(cookies.signed[:user_id]).to eq @json['data']['id']
      end
    end

    context "失敗時" do
      before do
        post "/users", params: { user: attributes_for(:taiki, name: nil) }
      end
    end
  end
end
