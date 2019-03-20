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
    new = self.new
    new.save#name = name
    new
  end

  def self.new_by_name(name)
    new = self.new
    new.name = name
    new
  end

  def self.create_by_name(name)
    new = self.new
    new.name = name
    new.save
    new
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !!find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    new = self.new
    new.artist_name = file_name.split(' - ')[0]
    new.name = file_name.split(' - ')[1].split('.mp3')[0]
    new
  end

  def self.create_from_filename(file_name)
    new = self.new
    new.artist_name = file_name.split(' - ')[0]
    new.name = file_name.split(' - ')[1].split('.mp3')[0]
    new.save
  end

  def self.destroy_all
    @@all.clear
  end
end
