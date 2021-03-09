require 'pry' 
class Artist
    attr_accessor :songs, :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        # @songs << song   ###NOT THIS ONE! jeeeeez ask this question
        song.artist = self
        # binding.pry
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end
    
    def self.find_or_create_by_name(artist)
        self.find(artist) ? self.find(artist) : self.new(artist)
        # if self.find(artist)
        # else 
        #     Artist.new(artist)
        # end
    end

    def self.find(name)
        self.all.find { | artist | artist.name == name }
    end

    def print_songs
        songs.each { | song | puts song.name }
    end

end