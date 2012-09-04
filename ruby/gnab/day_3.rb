require 'pp'

# Modify the CSV application to support an each method to return a CsvRow
# object. Use method_missing on that CsvRow to return the value for the column
# for a given heading.
module ActsAsCsv
  class CsvRow
    def initialize(headers, columns)
      @headers = headers
      @columns = columns
    end
    def method_missing(sym, *args, &block) 
      col_index = @headers.index(sym.to_s)
      @columns[col_index] unless col_index.nil?
    end
  end
  def self.included(base)
    base.extend ClassMethods
  end
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    def each(&block)
      @csv_contents.each do |row|
        yield CsvRow.new(@headers, row)
      end
    end
    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
csv.each { |row| puts row.one }
