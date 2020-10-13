
class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        #had to look at solution - did not know how to putt from directory but now I know 
        #how Dir.glob works!! 
        #Dir.glob takes a path, from there takes all files matching .mp3
        #and uses them as a parameter in the .collect method block
        @files = Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end

    def import
        self.files.each {|filename| Song.new_by_filename(filename)}
    end
end