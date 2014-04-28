# encoding:utf-8
require "rest_client"
require "rexml/document"

module Hotpepper
  class Client
    API_BASE_URL = "http://webservice.recruit.co.jp/hotpepper/gourmet/v1/".freeze

    attr_reader :api_key
    def initialize(api_key = nil)
      @api_key = api_key || ENV["API_KEY"] || raise(ArgumentError)
    end

    def gourmet_search(options = {})
      if options.empty?
        raise(ArgumentError)
      end
      RestClient.get API_BASE_URL, {params: options.merge(:key => @api_key)}
    end
  end

  class API
    attr_reader :response
    def initialize(options = {})
      client = Client.new(ENV["API_KEY"])
      @response = client.gourmet_search(options)
    end

  end
end
