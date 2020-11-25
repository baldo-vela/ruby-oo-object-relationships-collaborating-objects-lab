# The Artist class will be responsible for either creating the artist (if the artist doesn't exist in our program yet) or finding the instance of that artist (if the artist does exist).


class Artist
    # An Artist should be initialized with a name and should have an attribute accessor for this name. The class should have an @@all class variable and store all Artist instances in this variable

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def self.all
        #This class method should return all Artist instances.
        @@all
    end

    def add_song(passed_song)
        #This instance method exists to tell a passed in Song instance it belongs to this Artist instance.
        passed_song.artist = self
        @songs<<passed_song
    end

    def songs
        #This instance method returns an Array of all songs that belong to this Artist instance. This method should get all existing Song instances from Song and select only the ones that are associated with this Artist instance.
        array_of_songs = []
        Song.all.each { |a_song| array_of_songs.push(a_song) if a_song.artist == self }
        return array_of_songs

    end

    def self.find_or_create_by_name(name)
        #This class method should take the name that is passed in (remember, it will be a string), and do one of two things: find the artist instance that has that name or create one if it doesn't exist. Either way, the return value of the method will be an instance of an artist with the name attribute filled out.

        self.all.detect {|an_artist| an_artist.name == name} || Artist.new(name)
    end

    def print_songs
        #This instance methods outputs the names of all songs associated with this Artist instance.
        @songs.each { |a_song| puts a_song.name}

    end

    def save
        @@all << self
    end
    
end