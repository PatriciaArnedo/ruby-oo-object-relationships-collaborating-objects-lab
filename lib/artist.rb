class Artist 

    attr_accessor :name

    @@all = []

    def initialize(name=nil)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        
        if self.all.find{ |artist| artist.name == name} == nil
            self.new(name)
            
        else 
            return self.all.find{ |artist| artist.name == name}
        end

    end

    def print_songs
        self.songs.each { |song| puts song.name}
    end

end