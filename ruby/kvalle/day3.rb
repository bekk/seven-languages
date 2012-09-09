# Modify the CSV application to support an each method to return a
# CsvRow object. Use method_missing on that CsvRow to return the value
# for the column for a given heading.

# For example, for the file:
# one, two
# lions, tigers
# allow an API that works like this:
# csv = RubyCsv.new
# csv.each {|row| puts row.one}
# This should print "lions".

module ActsAsCsv
  
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
      @headers = file.gets.chomp.split(', ' )
      file.each do |row|
        @csv_contents << row.chomp.split(', ' )
      end
    end
    
    def each
      for row in @csv_contents
        yield CsvRow.new @headers, row
      end
    end
    
    attr_accessor :headers, :csv_contents
  
    def initialize
      read
    end
  end
  
  class CsvRow
    def initialize headers, data
      @headers = headers
      @data = data
    end
    
    def method_missing name, *args
      index = @headers.index(name.to_s)
      @data[index] unless index.nil?
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect

puts
csv.each {|row| puts row.one}
