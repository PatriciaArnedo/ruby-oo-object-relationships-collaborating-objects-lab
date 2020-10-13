

class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name=nil)
        @name = name
        @artist = artist
        save
    end

    def self.all
        @@all
    end
    
    def save 
        self.class.all << self
    end

    def self.new_by_filename(filename)
        names = filename.split(" - ")
        art_name = names[0]
        title = names[1]
        new_song = self.new(title)
        new_song.artist = art_name
        new_song.artist_name=(art_name)
        new_song
    end

    def artist_name=(artists_name)
        self.artist = Artist.find_or_create_by_name(artists_name)
    end
end

