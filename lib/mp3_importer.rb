#The MP3Importer class will parse all the filenames in the spec/fixtures folder and send the filenames to the Song class
class MP3Importer

    # Has a path attribute that gets set on initialization.

    # Contains a #files method that parses the files in the path, returning an array that contains the file names. Make sure you only get .mp3 files. Hint: Google around for how to get a list of files in a directory! You may want to look at the documentation for Ruby's built-in Dir class (Links to an external site.).

    # Contains an #import method that sends the song names to the Song class. Specifically, the method should call Song.new_by_filename, which will handle the creation of Song instances and their associated Artist instances.

    attr_accessor :path

    def initialize(passed_filepath)
        @path = passed_filepath
    end

    def files
        #files loads all the mp3 files in the path directory
        #normalizes the filename to just the mp3 filename with no path
        Dir.chdir(@path) { |path| Dir.glob("*.mp3")}
    end

    def import
        #imports the files into the library by creating songs from a filename
        files.each { |file| Song.new_by_filename(file)}
    end



end