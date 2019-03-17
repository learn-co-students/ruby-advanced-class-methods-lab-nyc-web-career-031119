require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

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

  def self.new_by_name(string)
    new_name = self.new
    new_name.name = (string)
    new_name
  end

  def self.create_by_name(string)
    property = self.new
    property.name = (string)
    property.save
    property
  end

  def self.find_by_name(name)
    self.all.find {|word| word.name == name}
  end

  def self.find_or_create_by_name(title)
      self.find_by_name(title) || self.create_by_name(title)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(string)
    song = self.new
    song.name = (string.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (string.split(" - ")[0])
    song
  end

  def self.create_from_filename(string)
    song = self.new
    song.name = (string.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (string.split(" - ")[0])
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
