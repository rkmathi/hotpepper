# encoding:utf-8
require "./hotpepper"

describe Hotpepper::Client do
  describe "#initialize" do
    let(:client) { Hotpepper::Client.new(api_key: ENV["API_KEY"]) }

    it "has always a API key" do
      expect(client.api_key).to eq ENV["API_KEY"]
    end
  end
end
