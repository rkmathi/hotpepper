# encoding:utf-8

module Hotpepper
  class Client
    API_BASE_URL = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/".freeze

    attr_reader :api_key
    def initialize(api_key: nil)
      @api_key = api_key || ENV["API_KEY"] || raise(ArgumentError)
    end
  end
end
