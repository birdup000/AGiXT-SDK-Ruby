# AGiXTSDK Ruby SDK

The AGiXTSDK is a Ruby library that provides a convenient way to interact with the AGiXT API. It abstracts the underlying HTTP requests and response handling, allowing you to focus on the business logic of your application.

## Installation

To use the AGiXTSDK, you can include the file in your Ruby project:

```ruby
require 'agixtsdk'
```

## Usage

To use the AGiXTSDK, you need to create an instance of the `AGiXTSDK` class and provide the necessary configuration parameters.

```ruby
sdk = AGiXTSDK.new(base_uri: 'http://localhost:7437', api_key: 'your_api_key')
```

The `AGiXTSDK` class provides the following methods:

### `get_providers`
Retrieves a list of all available providers.

```ruby
providers = sdk.get_providers
```

### `get_providers_by_service(service)`
Retrieves a list of providers that offer a specific service.

```ruby
providers_by_service = sdk.get_providers_by_service('service_name')
```

### `get_provider_settings(provider_name)`
Retrieves the settings for a specific provider.

```ruby
provider_settings = sdk.get_provider_settings('provider_name')
```

### `get_embed_providers`
Retrieves a list of all available embedding providers.

```ruby
embed_providers = sdk.get_embed_providers
```

### `get_embedders`
Retrieves a list of all available embedders.

```ruby
embedders = sdk.get_embedders
```

## Error Handling

The `AGiXTSDK` class includes a `handle_error` method that logs the error and raises an exception with a user-friendly message. You can customize this method to handle errors according to your application's requirements.
