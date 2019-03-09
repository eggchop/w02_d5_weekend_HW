class Room
  attr_reader :capacity, :songs, :guest_spend
  attr_accessor :drink, :guest_tracker
  def initialize(capacity, songs, guest_tracker, guest_spend)
    @capacity = capacity
    @songs = songs
    @guest_tracker = guest_tracker
    @guest_spend = guest_spend
    @drink = 5
  end

  def capacity_full?
    @guest_tracker.count >= @capacity ? true : false
  end

  def add_guest_to_guest_tracker(guest)
    @guest_tracker << guest
  end

  def remove_guest_from_guest_tracker(guest)
    @guest_tracker.delete(guest)
  end

  def add_cash_to_guest_spend
    @guest_spend += @drink
  end

  def get_list_of_songs_in_playlist
    @songs.map{|song| song.song_name}
  end

end
