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
      url = API_BASE_URL + "?key=" + @api_key + "&" + options.to_a.map{ |params| params.join("=") }.join("&")
      RestClient.get url
    end
  end

  class API
    def initialize(options = {})
      client = Client.new(ENV["API_KEY"])
      @response = client.gourmet_search(options)
    end

  end
end
