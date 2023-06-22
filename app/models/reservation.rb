class Reservation < ApplicationRecord
  after_create :checkout_checkin, unless: :last_checkout?

  belongs_to :listing
  has_one :mission, through: :listing

  private

  def checkout_checkin
    Mission.create!(mission_type: 'checkout_checkin', date: end_date.to_fs(:db), price: 10)
  end

  def last_checkout?
    if Mission.find(listing_id).where(mission_type: 'last_checkout').where(date: end_date.to_fs(:db))
      true
    else
      false
    end
  end
end
