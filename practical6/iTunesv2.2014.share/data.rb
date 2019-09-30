require_relative 'pred'

class DataAll
    include Pred
    attr_accessor :actors, :albums, :songs, :hashes
    
    def initialize()
        @actors = []
        @albums = []
        @songs = []
        @hashes = Hash.new
    end
    
end