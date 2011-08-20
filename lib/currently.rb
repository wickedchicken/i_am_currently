require "currently/version"

module Currently
  class << self
    def application
      @application ||= Currently::Application.new
    end
  end

  class Application
    def run
      puts "currently hasn't been written yet!"
    end
  end
end
