# encoding:utf-8
require "./hotpepper"

describe Hotpepper::Client do
  let(:client) { Hotpepper::Client.new(api_key=ENV["API_KEY"]) }

  describe "#initialize" do
    it "has always a API key" do
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
  end

end
