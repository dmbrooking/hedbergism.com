require_relative 'quote'

module Hedbergism
  class Quotes
    attr_reader :quotes

    def initialize(filename:)
      @quotes = []
      File.readlines(filename).each do |line|
        quotes << add_quote(line)
      end
    end

    def add_quote(line)
      Quote.new(line)
    end

    def first_quote
      quotes[0].to_s
    end

    def random
      i = rand(quotes.length)
      [quotes[i].to_s, i]
    end

    def quote(line_num)
      quotes[line_num].to_s
    end
  end
end
