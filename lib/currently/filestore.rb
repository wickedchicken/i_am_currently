require 'currently/backingstore'
require 'currently/entry'

module Currently
class Filestore < Backingstore
  def initialize(filename)
    # raise "log file #{filename} doesn't exist!" unless File.exists? filename
    @filename = filename
  end

  # retrieves last n entries
  def last(n = 1)
    self.parse.last n
  end

  # retrieves all entries (or as many as can be found)
  def all
    self.parse
  end

  # saves the provided entry
  def save(entry)
    File.open(@filename,"a"){|f|
      f.puts entry.serialize_to_line
    }
  end

  def parse
    # sloooooooow
    entries = []
    return entries unless File.exists? @filename
    File.open(@filename) {|f|
      f.readlines.each{|l|
        chunks = l.split("|")
        ts = chunks[0]
        rest = chunks[1..-1].join("|").split(" ")
        contexts = []
        rest.reverse.each {|c|
          if c =~ /^\#.+/
            contexts << c[1..-1]
          else
            break
          end
        }
        contexts = contexts.reverse
        text = rest[0..-(contexts.length + 1)].join(" ")
        entries << Entry.new(text,contexts,ts)
      }
      entries
    }
  end
end
end
