#!/opt/local/bin/ruby2.0 -w
# ERROR
# Copyright Mark Keane, All Rights Reserved, 2010

# Well its a class that handles errors.
class MyErr
	attr_accessor :type, :holder, :method
	def initialize(type, holder, method)
		@type = type
		@holder = holder
		@method = method
	end

  #  Method that is applied to an error object and prints out appropriate error.
  #  Ruby actually has its own error class that you can use, when you grow up.
	def do_it
		if @type == "multiple_answer_error"
			then puts "Error: Item #{@holder} raised #{@type} in #{@method}"
		elsif @type == "not_found_error"
			then puts "Error: #{@holder} was #{@type} in #{@method}"
		else puts "Error: Have been given an unknown error type: #{@type}"
		end
	end
	
	def self.check_ids(songs_file, owners_file)
	    songsIds = []
        CSV.foreach(songs_file, :headers => true) do |row|
            unless (row[0][0] == "#")
                if !songsIds.include?(row[4])
                    then songsIds << row[4]
                elsif songsIds.include?(row[4])
                    then p("Song ID maybe duplicated - check songs.csv file")
                end
            end
         end

         CSV.foreach(owners_file, :headers => true) do |row|
            unless (row[0][0] == "#")
                id = row[0]
                if !songsIds.include?(id)
                    then p("Wrong ID number #{id} as it is not in songs.csv file")
                        return false
                end
            end
	     end
	end

end