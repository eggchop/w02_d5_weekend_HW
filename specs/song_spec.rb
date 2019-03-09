require ('minitest/autorun')
require ('minitest/rg')

require_relative '../song.rb'

class SongTest < MiniTest::Test
  def setup
    @song1 = Song.new('Tennage Dirtbag')
    @song2 = Song.new('Hello')
    @song3 = Song.new('Hi')
    @song4 = Song.new('Jingle Bells')
    @songs = [@song1,@song2,@song3,@song4]
  end

  def test_get_song_name
    assert_equal('Jingle Bells', @song4.song_name)
  end
end
