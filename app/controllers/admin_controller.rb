class AdminController < ApplicationController
  def panel
    @tickets = Ticket.all
    @bookings = Booking.all
  end

  def index
  end
end
