# Modify the CSV application to support an each method to return a CsvRow object. 
# Use method_missing on that CsvRow to return the value for the column for a given heading.

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  class CsvRow
    def initialize(row, cols)
      @columns = cols
      @row = row
    end
    
    def method_missing(name, *args)
      row_pos = @columns.index(name.to_s)
      @row[row_pos]
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
    
    def each
      @csv_contents.each { |row| yield CsvRow.new(row, @headers) }
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

RubyCsv.new.each {|row| puts row.one}