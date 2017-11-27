module Hedbergism
  class Quote
    attr_reader :quote, :location, :date

    def initialize(line)
      @quote, @location, @date = line.split('~~')
    end

    def to_s
      quote.chomp
    end
  end
end
