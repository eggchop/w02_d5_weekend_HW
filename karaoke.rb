class Karaoke
  attr_reader :rooms
  attr_accessor :entry_fee, :entry_cash
  def initialize(rooms)
    @rooms = rooms
    @entry_fee = 20
    @entry_cash = 20
  end

  def add_guest_to_room(guest,room)
    if room.capacity_full?
      return "Capacity full, please select another room"
    else
      if guest.wallet >= @entry_fee
        room.add_guest_to_guest_tracker(guest)
        add_entry_fee_to_karaoke_cash
        guest.change_guest_wallet(-@entry_fee)
      else
        return "You cannot afford entry."
      end
    end
  end

  def check_out_guest_from_room(guest, room)
    room.remove_guest_from_guest_tracker(guest)
  end

def add_entry_fee_to_karaoke_cash
  @entry_cash += @entry_fee
end



end
