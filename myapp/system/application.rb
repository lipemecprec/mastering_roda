# /system/application.rb

# frozen_string_literal: true

require 'bundler/setup'
require 'dry/system/container'

# {Aplication} is a container used to register dependencies we need to call.
class Application < Dry::System::Container
  # Provide environment inferrer
  use :env, inferrer: -> { ENV.fetch('RACK_ENV', 'development') }

  # 'lib' is set relative to 'root' as as path which contains class definitions that can be auto-registered
  config.auto_register = %w[lib app]

  load_paths!('lib', 'app')
end
