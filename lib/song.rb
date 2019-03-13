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
    new.save
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
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(filename)
    new = self.new
    new.artist_name = filename.split(' - ')[0]
    new.name = filename.split(' - ')[1].split('.mp3')[0]
    new
  end

  def self.create_from_filename(filename)
    new = self.new
    new.artist_name = filename.split(' - ')[0]
    new.name = filename.split(' - ')[1].split('.mp3')[0]
    new.save
    new
  end

  def self.destroy_all
    @@all.clear
  end

end
