require ('minitest/autorun')
require ('minitest/rg')

require_relative '../room.rb'
require_relative '../song.rb'
require_relative '../guest.rb'
require_relative '../karaoke.rb'

class KaraokeTest < MiniTest::Test
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

    @room1 = Room.new(3, @songs, [@guest1,@guest2,@guest3], 30)
    @room2 = Room.new(1, @songs, [], 0)
    @room3 = Room.new(2, @songs, [@guest1], 20)

    @karaoke1 = Karaoke.new([@room1,@room2,@room3])

  end

  def test_get_number_rooms
    assert_equal(3,@karaoke1.rooms.count)
  end

  def test_check_in_guest_to_room__capacity_not_met
    @karaoke1.add_guest_to_room(@guest2,@room2)
    assert_equal(1, @room2.guest_tracker.count)
    assert_equal(40, @karaoke1.entry_cash)
  end

  def test_check_in_guest_to_room__capacity_met
    guest5 = Guest.new('steve','Alive', 27, 30)
    result = @karaoke1.add_guest_to_room(guest5,@room1)
    assert_equal(3, @room1.guest_tracker.count)
    assert_equal("Capacity full, please select another room", result)
  end

  def test_check_out_guest_from_room
    @karaoke1.check_out_guest_from_room(@guest1,@room1)
    assert_equal(2, @room1.guest_tracker.count)
  end

  def test_add_entry_fee_to_karaoke_cash
    @karaoke1.add_entry_fee_to_karaoke_cash
    assert_equal(40, @karaoke1.entry_cash)
  end
end
