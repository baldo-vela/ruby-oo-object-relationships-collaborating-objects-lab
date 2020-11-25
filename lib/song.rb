#The Song class will be responsible for creating songs given each filename and sending the artist's name (a string) to the Artist class
class Song

    #A Song should be initialized with a name and have attribute accessors for name and artist. The Song class should have an @@all class variable and store all Song instances in this variable.

    attr_accessor :name, :artist

    @@all = []

    def self.all
        #Return all #Song instances
        @@all
    end

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def name=(passed_song_name)
        @name=passed_song_name
    end

    def self.new_by_filename(passed_filename)
        #This method will do four things:

        # 1. It must parse a filename to find the song name and artist name. (Hint: every file separates the song and artist with a " - ").

        # 2. From here, we will create a new song instance using the song name we gathered from the filename.

        # 3. We'll also want to associate that new song with the appropriate artist. Use the artist attribute accessor to assign this

        # 4. Return the new song instance.
        # eg. "Michael Jackson - Black or White - pop.mp3"
        filename_array = passed_filename.split(" - ")
        song = Song.new(filename_array[1])
        song.artist_name=(filename_array[0])
        return song
    end

    def artist_name=(passed_name_string)
        # This method will do two things. Both of these things will involve collaboration with the Artist class:

        #     Turn the artist's name as a string into an Artist object.
            
        #     First we need to get the instance of the Artist class that represents that artist. There are two possibilities here:
            
        #     Either we have to create that Artist instance, or
        #     it already exists and we have to find that Artist instance.
        #     To achieve this, we'll need to collaborate with the Artist class. We want to send an artist's name (a string — remember we are getting this from the parsed filename) to the Artist class and either create or find the artist instance. This sounds like a great place to use method Artist.find_or_create_by_name.
            
        #     Assign the song to the artist. Now that we have the artist instance, we'll want to again collaborate with the Artist class by calling on the Artist#add_song(some_song) method.
        passed_name_string = Artist.find_or_create_by_name(passed_name_string)
        self.artist = passed_name_string
    end


    
end
