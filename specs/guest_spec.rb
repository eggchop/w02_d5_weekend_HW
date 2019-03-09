require ('minitest/autorun')
require ('minitest/rg')

require_relative '../guest.rb'
require_relative '../room.rb'
require_relative '../song.rb'

class GuestTest < MiniTest::Test
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

  def test_get_favourite_song_name
    assert_equal('Jingle Bells', @guest4.fav_song)
  end

  def test_get_age
    assert_equal(30, @guest4.age)
  end

  def test_get_wallet
    assert_equal(50, @guest3.wallet)
  end

  def test_change_guest_wallet
    result = @guest2.change_guest_wallet(20)
    assert_equal(40, result)
  end

  def test_guest_can_afford_drink__true
    result = @guest2.guest_can_afford_drink?(@room1)
    assert_equal(true, result)
  end

  def test_guest_can_afford_drink__false
    result = @guest4.guest_can_afford_drink?(@room1)
    assert_equal(false, result)
  end

  def test_guest_buys_drink
    @guest3.guest_buys_drink(@room1)
    assert_equal(true, @guest3.guest_can_afford_drink?(@room1))
    assert_equal(45, @guest3.wallet)
    assert_equal(25, @room1.guest_spend)
  end

  def test_check_for_fav_song
    result = @guest1.check_for_fav_song(@room1)
    assert_equal('Wooo!', result)
  end
end
