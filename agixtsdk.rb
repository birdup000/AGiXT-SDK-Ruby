require 'httparty'
require 'json'

class AGiXTSDK
  def initialize(base_uri: nil, api_key: nil)
    @base_uri = base_uri || 'http://localhost:7437'
    if api_key.nil?
      @headers = { 'Content-Type' => 'application/json' }
    else
      api_key = api_key.sub('Bearer ', '').sub('bearer ', '')
      @headers = {
        'Authorization' => api_key,
        'Content-Type' => 'application/json'
      }
    end

    @base_uri = @base_uri[0..-2] if @base_uri[-1] == '/'
  end

  def handle_error(error)
    puts "Error: #{error}"
    raise "Unable to retrieve data. #{error}"
  end

  def get_providers
    begin
      response = HTTParty.get(
        "#{@base_uri}/api/provider",
        headers: @headers
      )
      response.parsed_response['providers']
    rescue => e
      handle_error(e)
    end
  end

  def get_providers_by_service(service)
    begin
      response = HTTParty.get(
        "#{@base_uri}/api/providers/service/#{service}",
        headers: @headers
      )
      response.parsed_response['providers']
    rescue => e
      handle_error(e)
    end
  end

  def get_provider_settings(provider_name)
    begin
      response = HTTParty.get(
        "#{@base_uri}/api/provider/#{provider_name}",
        headers: @headers
      )
      response.parsed_response['settings']
    rescue => e
      handle_error(e)
    end
  end

  def get_embed_providers
    begin
      response = HTTParty.get(
        "#{@base_uri}/api/embedding_providers",
        headers: @headers
      )
      response.parsed_response['providers']
    rescue => e
      handle_error(e)
    end
  end

  def get_embedders
    begin
      response = HTTParty.get(
        "#{@base_uri}/api/embedders",
        headers: @headers
      )
      response.parsed_response['embedders']
    rescue => e
      handle_error(e)
    end
  end

  # Add more methods here...
end
