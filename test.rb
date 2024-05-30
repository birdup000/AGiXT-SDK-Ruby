require 'minitest/autorun'
require 'vcr'
require_relative 'agixtsdk'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

class AGiXTSDKTest < Minitest::Test
  def setup
    @sdk = AGiXTSDK.new(base_uri: 'http://localhost:7437', api_key: 'your_api_key')
  end

  def test_get_providers
    VCR.use_cassette('get_providers') do
      providers = @sdk.get_providers
      assert_kind_of Array, providers
      assert_includes providers, 'provider_name'
    end
  end

  def test_get_providers_by_service
    VCR.use_cassette('get_providers_by_service') do
      providers = @sdk.get_providers_by_service('service_name')
      assert_kind_of Array, providers
      assert_includes providers, 'provider_name'
    end
  end

  def test_get_provider_settings
    VCR.use_cassette('get_provider_settings') do
      settings = @sdk.get_provider_settings('provider_name')
      assert_kind_of Hash, settings
      assert_includes settings.keys, 'setting_key'
    end
  end

  def test_get_embed_providers
    VCR.use_cassette('get_embed_providers') do
      providers = @sdk.get_embed_providers
      assert_kind_of Array, providers
      assert_includes providers, 'embed_provider_name'
    end
  end

  def test_get_embedders
    VCR.use_cassette('get_embedders') do
      embedders = @sdk.get_embedders
      assert_kind_of Hash, embedders
      assert_includes embedders.keys, 'embedder_name'
    end
  end

  # Add more test methods for other SDK methods
end
