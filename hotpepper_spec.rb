# encoding:utf-8
require "./hotpepper"
require "./helper"

#PR練習用コメント

describe Hotpepper::Client do

  let(:client) { Hotpepper::Client.new }

  describe "#initialize" do
    it "passes directly the api_key" do
      expect(Hotpepper::Client.new(api_key=Helper.api_key).api_key).to eq ENV["API_KEY"]
    end

    it "passes the api_key using ENV['API_KEY']" do
      expect(client.api_key).to eq ENV["API_KEY"]
    end
  end

  describe ".gourmet_search" do
    it "has always search options" do
      expect { client.gourmet_search }.to raise_error(ArgumentError)
      expect(client.gourmet_search("hoge" => "hoge")).to be_a(String)
    end

  end
end

describe Hotpepper::API do

  describe "#initialize" do
    it "has a client instance" do
      expect { Hotpepper::API.new("hoge" => "hoge") }.not_to raise_error(Exception)
    end

    let(:api) { Hotpepper::API.new("hoge" => "hoge") }
    it "return xml response" do
      expect(api.response).not_to eq nil
      expect(api.response).to be_a(String)
    end
  end

  describe ".list" do
    pending
  end

end
