class Song

  attr_accessor :name, :artist_name

  @@all = []

  # def initialize(name)
  #   @name = name
  #   @@all << self
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    Song.create_by_name(name)
    Song.find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
  new_file = filename.split(" - ")
  artist_file = new_file[0]
  name_file = new_file[1].split(".")

  new_song = self.new
  new_song.name = name_file[0]
  new_song.artist_name = artist_file
  new_song
  end

  def self.create_from_filename(filename)
    new_file = filename.split(" - ")
    artist_file = new_file[0]
    name_file = new_file[1].split(".")

    new_song = self.create
    new_song.name = name_file[0]
    new_song.artist_name = artist_file
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
