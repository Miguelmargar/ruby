#!/usr/bin/ruby -w
# ALBUM
# Copyright Mark Keane, All Rights Reserved, 2014

require 'csv'
require 'time'

# Class that encodes details of an album.
class Album
	attr_accessor :name, :tracks, :length, :artist, :owners, :id
	def initialize(name, tracks, length, artist, owners)
		@name = name
		@tracks = tracks
		@length = length
		@artist = artist
    		@owners = owners
		@id = name.object_id
	end

  # Method that prints out the contents of an album object nicely.
	def to_s
		puts "The album #{@name} by #{@artist}. \n"
	end	

  # Method that checks if an object given to it is an album.
	def isa?
		instance_of?(Album)
	end

  # Method makes an album object; just uses Album.new; really
  # just being a bit explicit and obvious.

	def self.make_album(name, tracks, length, artist, owners)
		Album.new(name, tracks, length, artist, owners)
	end

  # Class Method that builds albums from song object's contents.
  # It returns an array of album objects.  It calls another class method that
  # builds a single album, given the name of that album.

	def self.build_all(albums = [])
		alb_names = []
		CSV.foreach("songs.csv", :headers => true) do |row|
			if (row[0][0] == '#')
				next
			end
			if !alb_names.include? row[2]
				then alb_names << row[2]
			end
		end

		alb_names.each do |name|
			albums << build_an_album_called(name)
		end
		return albums		
	end

  # Class method that takes an album name, it finds all the sounds that are in that album
  # builds up arrays of the song-names (tracks), runtimes, artist names.  These all get used
  # to populate the various attributes of the album object.

	def self.build_an_album_called(album_name)
		name = album_name
		tracks = 0
		len_secs = 0
		artist = ""
		owners = 0

     		CSV.foreach("songs.csv", :headers => true) do |row|
			if (row[0][0] == '#')
				next
			end
			if (row[2] == album_name)
			tracks += 1
			split = row[3].split(".")
			mins = split[0]
			secs = split[1]
			len_secs += (mins.to_i)*60 + secs.to_i
			artist = row[1]
			end
		end
		len_mins = Time.at(len_secs).utc.strftime("%M.%S")
		album = Album.new(name, tracks, len_mins, artist, owners)
		return album
	end

end

p Album.build_an_album_called("Perfect Day")
puts
p Album.build_all()



