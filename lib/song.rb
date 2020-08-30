require 'pry'

class Song

  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name)
    @name = name
    @artist_name = nil
  end
  
  def save
    self.class.all << self
  end

  def self.create
    song = Song.new(nil)
    song.save
    return song
  end

  def self.new_by_name(name)
    Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.find { |song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    find = self.find_by_name(name)
    find ? find : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song|
      song.name
    }
  end

  def self.new_from_filename(filename)
    4.times {
      filename = filename.chop
    }
    array = filename.split(" - ")
    song = Song.new(array[1])
    song.artist_name = array[0]
    return song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    return song
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

end
