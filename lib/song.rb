require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = Song.new(name)
    @name = new_song
  end

  def self.create_by_name(name)
    new_song = Song.new(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical

    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(mp3)
    array = mp3.split(/ - |.mp3/)
    song = Song.new(array[1])
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(mp3)
    array = mp3.split(/ - |.mp3/)
    song = Song.new(array[1])
    @@all << song
    song.artist_name = array[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
