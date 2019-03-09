require ('minitest/autorun')
require ('minitest/rg')

require_relative '../room.rb'
require_relative '../song.rb'
require_relative '../guest.rb'

class RoomTest < MiniTest::Test
  def setup
    @guest1 = Guest.new('bob','Tennage Dirtbag', 17, 100)
    @guest2 = Guest.new('jon', 'Hello', 82, 20)
    @guest3 = Guest.new('jill', 'Hi', 43, 50)
    @guest4 = Guest.new('tom', 'Jingle Bells', 30, 0)
    @guests = [@guest1,@guest2,@guest3,@guest4]
    @song1 = Song.new('Tennage Dirtbag')
    @song2 = Song.new('Hello')
    @song3 = Song.new('Hi')
    @song4 = Song.new('Jingle Bells')
    @songs = [@song1,@song2,@song3,@song4]

    @room1 = Room.new(3, @songs, [@guest1,@guest2], 20)

  end

  def test_get_capacity
    assert_equal(3,@room1.capacity)
  end

  def test_get_songs_count
    assert_equal(4, @room1.songs.count)
  end

  def test_guest_tracker
    assert_equal(2, @room1.guest_tracker.count)
  end

  def test_guest_spend
    assert_equal(20, @room1.guest_spend)
  end

  def test_capacity_full__true
    room = Room.new(3, @songs, [@guest1,@guest2,@guest3], 20)
    result = room.capacity_full?
    assert_equal(true, result)
  end

  def test_capacity_full__false
    room = Room.new(4, @songs, [@guest1,@guest2,@guest3], 20)
    result = room.capacity_full?
    assert_equal(false, result)
  end

  def test_add_guest_to_guest_tracker
    room = Room.new(4, @songs, [], 0)
    room.add_guest_to_guest_tracker(@guest2)
    assert_equal(1,room.guest_tracker.count)
  end

  def test_remove_guest_from_guest_tracker
    @room1.remove_guest_from_guest_tracker(@guest2)
    assert_equal(1,@room1.guest_tracker.count)
  end

  def test_add_cash_to_guest_spend
    result = @room1.add_cash_to_guest_spend
    assert_equal(25, @room1.guest_spend)
  end

  def test_get_list_of_songs_in_playlist
    guest1 = Guest.new('bob','Tennage Dirtbag', 17, 100)
    guest2 = Guest.new('jon', 'Hello', 82, 20)
    room = Room.new(3, [Song.new('Tennage Dirtbag'),Song.new('Hello')], [guest1,guest2], 20)
    result = room.get_list_of_songs_in_playlist
    assert_equal(['Tennage Dirtbag','Hello'], result)
  end


end
