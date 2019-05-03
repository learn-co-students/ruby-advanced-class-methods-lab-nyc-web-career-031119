class Song
  attr_accessor :name, :artist_name
  @@all = []

   def self.create
    song =  self.new
    song.save
    song
   end

   def self.new_by_name (name)
     song = self.new
     song.name = name
     song
   end

   def self.create_by_name(name)
       song = self.create
       song.name = name
         song
   end

   def self.find_by_name(name)
       self.all.find {|song| song.name == name}
   end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) ||  self.create_by_name(name)
  end

  def self.all
    @@all
  end

  def self.alphabetical
      @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    arr = filename.split(/[-|.]/)
    artist_name = arr[0].strip
    song_name = arr[1].strip
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    arr = filename.split(/[-|.]/)
    artist_name = arr[0].strip
    song_name = arr[1].strip
    song = create_by_name(song_name)
    song.artist_name = artist_name
  end

  def self.destroy_all
     self.all.clear
  end

  def save
    self.class.all << self
  end

end
