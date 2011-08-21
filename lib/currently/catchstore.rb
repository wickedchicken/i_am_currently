require 'currently/backingstore'
require 'currently/entry'
require 'catch'

module Currently
  class Catchstore < Backingstore
  def initialize(user,pass)
    @catch = Catch::Client.new(:username => user, :password => pass)
    @context = "#iac"
  end

  # retrieves last n entries
  def last(n = 1,context = nil)
    context ||= @context
    note_ids = @catch.search(context,:limit => n).map{|x| x["id"].to_i}
    ents = note_ids.map{|x|
      e = @catch.note(x)
      # Entry.new(e["text"],e["tags"],e["created_at"])
      # tags are already in the text, we don't want dupes
      Entry.new(e["text"],[],e["created_at"])
    }
    ents
  end

  # retrieves all entries (or as many as can be found)
  def all
    super
  end

  # saves the provided entry
  def save(entry)
    @catch.add_note(:text => entry.to_s + " #{@context}")
  end
  end
end
