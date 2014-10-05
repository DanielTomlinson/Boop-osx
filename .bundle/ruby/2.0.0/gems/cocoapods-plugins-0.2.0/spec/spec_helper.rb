# Set up coverage analysis
#-----------------------------------------------------------------------------#
if ENV['CI'] || ENV['GENERATE_COVERAGE']
  require 'simplecov'
  require 'coveralls'

  if ENV['CI']
    SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  elsif ENV['GENERATE_COVERAGE']
    SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
  end
  SimpleCov.start do
    add_filter '/travis_bundle_dir'
  end
end

# General Setup
#-----------------------------------------------------------------------------#

require 'pathname'
ROOT = Pathname.new(File.expand_path('../../', __FILE__))
$LOAD_PATH.unshift((ROOT + 'lib').to_s)
$LOAD_PATH.unshift((ROOT + 'spec').to_s)

require 'bundler/setup'
require 'bacon'
require 'mocha-on-bacon'
require 'pretty_bacon'

require 'webmock'
include WebMock::API

require 'cocoapods'
require 'cocoapods_plugin'

#-----------------------------------------------------------------------------#

# The CocoaPods namespace
#
module Pod
  # Disable the wrapping so the output is deterministic in the tests.
  #
  UI.disable_wrap = true

  # Redirects the messages to an internal store.
  #
  module UI
    @output = ''
    @warnings = ''

    class << self
      attr_accessor :output
      attr_accessor :warnings

      def puts(message = '')
        @output << "#{message}\n"
      end

      def warn(message = '', _actions = [])
        @warnings << "#{message}\n"
      end

      def print(message)
        @output << message
      end
    end
  end
end

#-----------------------------------------------------------------------------#

# Bacon namespace
#
module Bacon
  # Add a fixture helper to the Bacon Context
  class Context
    ROOT = ::ROOT + 'spec/fixtures'

    def fixture(name)
      ROOT + name
    end
  end
end

#-----------------------------------------------------------------------------#

# SpecHelper namespace
#
module SpecHelper
  # Add this as an extension into the Search and List specs
  # to help stub the plugins.json request
  module PluginsStubs
    def stub_plugins_json_request(json = nil, status = 200)
      body = json || File.read(fixture('plugins.json'))
      stub_request(:get, Pod::Command::PluginsHelper::PLUGINS_URL)
      .to_return(:status => status, :body => body, :headers => {})
    end
  end

  # Add this as an extension into the Create specs
  module PluginsCreateCommand
    def create_command(*args)
      Pod::Command::Plugins::Create.new CLAide::ARGV.new(args)
    end
  end

  # Add this as an extension into the Search specs
  module PluginsSearchCommand
    def search_command(*args)
      Pod::Command::Plugins::Search.new CLAide::ARGV.new(args)
    end
  end
end
