# frozen_string_literal: true

module Binance
  class Client
    include HTTParty

    base_uri 'https://api.binance.com'

    class << self
      def public_send(path: '/', params: {})
        response = get(path, query: params, headers: build_headers)
        process(response)
      end

      def private_send(method, path, params: {})
        params.delete_if { |k, v| v.nil? }
        params = params.merge(timestamp: timestamp)
        params = params.merge(signature: signature(params: params))

        case method
        when :get
          response = send(method, path, headers: build_headers, query: params)
        else
          response = if params.empty?
                      send(method, path, headers: build_headers)
                    else
                      send(method, path, headers: build_headers, query: params)
                    end
        end
        process(response)
      end

      private

      def timestamp
        Time.now.utc.strftime('%s%3N')
      end

      def signature(params:)
        payload = params.map { |key, value| "#{key}=#{value}" }.join('&')
        Authentication.signature(payload)
      end

      def build_headers
        {
          "Accept": 'application/json',
          "Accept-Charset": 'UTF-8',
          "Content-Type": 'application/json',
          "X-MBX-APIKEY": Authentication.public_api_key
        }
      end

      def payload(method, path, timestamp, params)
        method = method.upcase
        unless params.empty?
          return "#{method}#{path}#{timestamp}#{params.to_json}"
        end

        "#{method}#{path}#{timestamp}"
      end

      def process(response)
        result = if response.body.empty?
                  '{}'
                 else
                   response.body
                 end
        data = JSON.parse(result, symbolize_names: true)
        raise Error.new(response.code, data) if Error.error_response?(response)

        data
      end
    end
  end
end
