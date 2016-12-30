require 'rspec'
require_relative '../lib/kl/date_range'
require 'date'

describe KL::DateRange do
  let(:ending_date) { Date.civil(2016,12,31) }
  let(:beginning_date) { ending_date.next_day.prev_year(1) }
  let(:date_range) { KL::DateRange(beginning_date..ending_date).every(months: 1) }
  describe '#every' do
    it 'should have the the first element being the beginning given date/time' do
      expect(date_range.first).to eq(beginning_date)
    end
    it 'should have the the last element being the ending given date/time' do
      expect(date_range.last).to eq(beginning_date.next_month(11))
    end
    it 'should have number of months between the given two dates' do
      expect(date_range.size).to eq 12
    end
  end

end