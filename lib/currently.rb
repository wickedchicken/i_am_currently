require 'currently/version'
require 'currently/filestore'
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

        opt :filestore, "Use local filestore", :type => :string
      end

      fname = ENV["HOME"] + "/.currentlog"
      fname = opts[:filestore] if opts[:filestore] 
      backingstore = Filestore.new(fname)
      if ARGV.count > 0
        text = ARGV.join(" ")
        backingstore.save(Entry.new(text))
      else
        last = backingstore.last
        if last.count > 0 then
          puts last.first.to_s
        else
          puts "[ entry log is empty ]"
        end
      end
    end
  end
end
