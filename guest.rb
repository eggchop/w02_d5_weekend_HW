class Guest
  attr_reader :fav_song, :age, :wallet, :name
  def initialize(name, fav_song, age, wallet)
    @name = name
    @fav_song = fav_song
    @age = age
    @wallet = wallet
  end

  def change_guest_wallet(amount)
    @wallet += amount
  end

  def guest_can_afford_drink?(room)
    return @wallet > room.drink
  end

  def guest_buys_drink(room)
    guest_can_afford_drink?(room)
    change_guest_wallet(-room.drink)
    room.add_cash_to_guest_spend
  end

  def check_for_fav_song(room)
    return 'Wooo!' if room.get_list_of_songs_in_playlist.include?(@fav_song)
  end
end
