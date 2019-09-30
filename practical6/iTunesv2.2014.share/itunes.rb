#!/usr/bin/ruby -w
# iTUNES
# Copyright Mark Keane, All Rights Reserved, 2014

#This is the top level
require 'csv'
require_relative 'pred'
require_relative 'data'
require_relative 'actor'
require_relative 'album'
require_relative 'song'
require_relative 'reader'
require_relative 'utilities'
require_relative 'error'


#songs_file = ARGV[0]                  #for command line
#owners_file = ARGV[1]                 #for command line

reader = Reader.new
info = DataAll.new()
songs_file = 'songs.csv'             #in RubyMine
owners_file = 'owners.csv'           #in RubyMine

puts "\nProcessing Songs from file: #{songs_file}"
info.songs = reader.read_in_songs(songs_file)

puts "Testing the module Pred for true..."
song = info.songs.first
p song.isa?(Song)

puts "Processing Ownership from file: #{owners_file}"
info.hashes = reader.read_in_ownership(owners_file)

puts "Building all owners..."
info.actors = Actor.build_all(info)

puts "Testing module Pred for false..."
actor = info.actors.first
p actor.isa?(Song)

puts "Checking song ownership details..."
if MyErr.check_ids(songs_file, owners_file)
    then
        puts "Updating songs with ownership details..."
        info.songs.each{|song| song.owners = info.hashes[song.id]}
        
        puts "Building All Albums..."
        info.albums = Album.build_all()
        
        # Given the name of a song and a person; let them buy the song
        puts "\nMarkk buys The Cure..."
        song1 = Util.fetch(info, "The Cure")
        mark =   Util.fetch(info, "markk")
        mark.to_s
        song1.to_s
        mark.buys_song(song1)
        song1.to_s
        
        # What songs does Markk own
        puts "\nHow many songs does Markk own..."
        p mark.what_songs_does_he_own(info).size
        
        puts "\nPlay The Cure..."
        song1.play_song
        
        # Print out all songs
        puts "\nPrinting full details of all songs..."
        info.songs.each{|song| p song}
        
        # Call it like this in the command line.
        # markkean% ruby itunes.rb songs.csv owners.csv
else p("Please check files for correct songs and ownership details")
end
