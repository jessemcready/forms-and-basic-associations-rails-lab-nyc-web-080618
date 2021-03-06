class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def song_artist_name
    self.artist ? self.artist.name : nil
  end

  def song_artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    # self.artist = artist
  end

  def note_contents=(notes)
    notes.each do |content|
      if content != ""
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    non_empty_notes = notes.select do |note|
      note.content != ""
    end
    non_empty_notes.map do |note|
      note.content
    end
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    self.artist.name
  end


end
