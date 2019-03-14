class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find{ |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    exist = self.find_by_name(song_name) 
    exist ||= self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")    
    song_name = file[1][0..-5]
    song = self.new_by_name(song_name)
    song.artist_name = file[0]
    song
  end

  def self.create_from_filename(filename)
    file = filename.split(" - ")    
    song_name = file[1][0..-5]
    song = self.create_by_name(song_name)
    song.artist_name = file[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end 

  def save
    self.class.all << self
  end

end
