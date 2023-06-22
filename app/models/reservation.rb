class Reservation < ApplicationRecord
  after_create :checkout_checkin, unless: :last_checkout?

  belongs_to :listing
  has_one :mission, through: :listing, dependent: :destroy

  private

  def checkout_checkin
    Mission.create!(listing: self.listing, mission_type: 'checkout_checkin', date: end_date.to_fs(:db), price: 10 * self.listing.num_rooms)
  end

  def last_checkout?
    Mission.where(listing: self.listing, mission_type: 'last_checkout', date: end_date.to_fs(:db)).any?
  end
end
