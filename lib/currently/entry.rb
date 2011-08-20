module Currently
class Entry
  def initialize(text,contexts = [],ts = Time.now.to_s)
    @text = text
    @contexts = contexts
    @timestamp = ts
  end

  def to_s
    @text + @contexts.map{|x| "#" + x}.join(" ")
  end

  # put this into sep module?
  def serialize_to_line
    @timestamp.to_s + "| " + @text + " " + @contexts.map{|x| "#" + x}.join(" ")
  end
end
end
