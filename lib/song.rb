class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all.push(self)
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
    @@all.find {|song| song.name === song_name}
    #self.all.include?(song_name) #This passes the first but not second test
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name) #if can't find song name, then it will create the song name
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end

=begin
  def self.alphabetical
    self.all.sort do |a.name, b.name|
      a.name <=> b.name
    end
  end
=end

def self.new_from_filename(filename)
  parts = filename.split(" - ")

  song = self.new

  artist_name = parts[0]
  song.artist_name = artist_name
  
  song_name = parts[1].gsub(".mp3", "")
  song.name = song_name

  song 
end

def self.create_from_filename(filename)
  parts = filename.split(" - ")
  song = self.create

  artist_name = parts[0]
  song.artist_name = artist_name
  song_name = parts[1].gsub(".mp3", "")
  song.name = song_name

  song
end

def self.destroy_all
  self.all.clear
  #@@all.length.times do @@all.shift()
  end
end
end