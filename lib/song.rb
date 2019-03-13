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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(file_name)
    parsed = self.parse_filename(file_name)
    obj = self.create
    obj.name = parsed[1]
    obj.artist_name = parsed[0]
    obj
  end

  def self.create_from_filename(file_name)
    parsed = self.parse_filename(file_name)
    obj = self.create
    obj.name = parsed[1]
    obj.artist_name = parsed[0]
    obj
  end

  def self.parse_filename(file_name)
    splited = file_name.split(" - ")
    splited[1] = splited[1].split(".")[0]
    splited
  end

  def self.destroy_all
    @@all.clear
  end

end
