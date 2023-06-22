class Booking < ApplicationRecord
  after_create :first_checkin, :last_checkout

  belongs_to :listing
  has_many :missions, through: :listing, dependent: :destroy

  private

  def first_checkin
    Mission.create!(listing: self.listing, mission_type: 'first_checkin', date: start_date.to_fs(:db), price: 10 * self.listing.num_rooms)
  end

  def last_checkout
    Mission.create!(listing: self.listing, mission_type: 'last_checkout', date: end_date.to_fs(:db), price: 5 * self.listing.num_rooms)
  end
end
