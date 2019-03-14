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
    Song.new.save
    @@all.last
  end

  def self.new_by_name(song_name)
    new_song = create
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = new_by_name(song_name)
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if find_by_name(song_name)
      find_by_name(song_name)
    else
      create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song_attrs = filename.split(/[-.]/)
    new_song = new_by_name(song_attrs[1].strip)
    new_song.artist_name = song_attrs[0].strip
    new_song
  end

  def self.create_from_filename(filename)
    song_attrs = filename.split(/[-.]/)
    new_song = new_by_name(song_attrs[1].strip)
    new_song.artist_name = song_attrs[0].strip
    new_song
  end

  def self.destroy_all
    @@all = []
  end
end
