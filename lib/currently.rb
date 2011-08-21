require 'currently/version'
require 'currently/filestore'
require 'currently/catchstore'
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

        opt :filestore, "use local filestore", :type => :string
        opt :context, "select a context (work, home, etc)", :type => :string
        opt :catch, "use catch, specify username:password", :type => :string
      end

      unless opts[:catch]
        fname = ENV["HOME"] + "/.currentlog"
        fname = opts[:filestore] if opts[:filestore] 
        backingstore = Filestore.new(fname)
      else
        user = opts[:catch].split(":")[0]
        Trollop::die :catch, "must be in the format: username:password" if opts[:catch].split(":").length < 2
        pw = opts[:catch].split(":")[1]
        backingstore = Catchstore.new(user,pw)
      end

      if ARGV.count > 0
        text = ARGV.join(" ")
        if opts[:context]
          ent = Entry.new(text,[opts[:context]])
        else
          ent = Entry.new(text)
        end
        backingstore.save(ent)
      else
        if opts[:context]
          last = backingstore.last(1,opts[:context])
        else
          last = backingstore.last
        end
        if last.count > 0 then
          puts last.first.to_s
        else
          puts "[ entry log is empty ]"
        end
      end
    end
  end
end
