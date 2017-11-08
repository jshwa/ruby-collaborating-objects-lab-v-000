require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist_name)
     self.all.detect{|artist|artist.name == artist_name} || self.create(artist_name)
  end

  def self.find(artist_name)
    self.all.detect{|artist|artist.name == artist_name}
  end

  def self.create(name)
    artist = Artist.new(name).save
    artist.save
    artist
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end
end
