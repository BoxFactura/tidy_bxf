# frozen_string_literal: true

# :nodoc:
class TidyBxf
  # Catch and configure tidy binary path
  class Configuration
    attr_accessor :binary_path

    def initialize
      @binary_path = nil
    end
  end

  # On a initializer or somewhere else in your code, if you want to use a different version or binary
  # instead of the binary provided in this gem, you can assign a path for a binary like this:
  #
  #   TidyBxf.configure do |config|
  #     config.binary_path = 'path/to/tidy'
  #   end
  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
