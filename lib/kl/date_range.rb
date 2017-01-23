# require 'active_support/core_ext/date/calculations'
# require 'active_support/core_ext/date_time/calculations'
# require 'active_support/core_ext/time/calculations'
require 'active_support'

module KL
  class DateRange < Range
    class InvalidStep < StandardError

    end
    VERSION = '0.1.1'

    def every(step, &block)
      # Uses Date to provide precise Time calculations for years, months, and days.
      # The +options+ parameter takes a hash with any of these keys: <tt>:years</tt>,
      # <tt>:months</tt>, <tt>:weeks</tt>, <tt>:days</tt>, <tt>:hours</tt>,
      # <tt>:minutes</tt>, <tt>:seconds</tt>.
      raise InvalidStep, "#{step.keys.first} is not a valid step." unless [:years, :months, :weeks, :days, :hours, :minutes, :secords].include?(step.keys.first)
      c_time      = self.begin.to_datetime
      finish_time = self.end.to_datetime
      foo_compare = self.exclude_end? ? :< : :<=

      arr = []
      while c_time.send(foo_compare, finish_time) do
        arr << c_time
        c_time = c_time.advance(step)
      end

      return arr
    end
  end

  def DateRange(range)
    KL::DateRange.new(range.begin, range.end, range.exclude_end?)
  end

  module_function :DateRange
end
