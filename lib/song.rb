require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all    # returns array of all instances of songs
    @@all
  end

  def save
    self.class.all << self   # not sure what this does, sets self.all as a class variable?
  end

  def self.create #class constructor
    song = self.new     # instantiate and 
    self.all << song    # saves the song 
    song                # then returns the new song that was created  
  end

  def self.new_by_name(title) #class constructor
    song = self.new    # instantiates the song 
    song.name = title  # to a name property 
    song               # then returns the song 
  end

  def self.create_by_name(title) #class constructor
    song = self.create   # instantiates and saves a song to a name property 
    song.name = title
    song
  end

  def self.find_by_name(title) #class finder
    result = self.all.detect {|song| song.name == title}    # find a song present in @@all by name
       # basically the same as create_by_name but doesnt set it equal to title, so it prints the name but doesn't return it
    result
  end

  def self.find_or_create_by_name(title)
    #either return a matching song instance with that name or create a new song with the name and return the song instance
    result = self.find_by_name(title)
    if result     # if the result, after passing thru find_by_name is still the same, then print it, but if it's not the same then run it through create_by_name 
      result
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}   # sort_by method sorts letters alphabetically and numbers numerically 
    sorted
  end

  def self.new_from_filename(filename)      
    song_array = filename.split(" - ")      # parsing the filename input, separating with
           # the ` - ` delimiter
    song_array[1] = song_array[1].chomp(".mp3")    # finishing parsing by removing '.mp3'  
    song = self.new
    song.name = song_array[1]       # song name set 
    song.artist_name = song_array[0]   # artist name set 
    song        # returns a song instance 
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
