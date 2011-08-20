require 'currently/version'
require 'trollop'

module Currently
  class << self
    def application
      @application ||= Currently::Application.new
    end
  end

  class Application
    def run
      opts = Trollop::options do
        version "currently v#{VERSION} (c) 2011 Mike Stipicevic"
        banner <<-EOS
  currently is a 'concentration log' designed to keep track of what you
  are working or thinking about right at this moment.

  usage:
            currently [options] [entry]

  leaving out an entry will display the last one entered

  available [options] are:
EOS
      end
      puts "currently hasn't been written yet!"
    end
  end
end
