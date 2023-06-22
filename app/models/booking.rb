class Booking < ApplicationRecord
  after_create :first_checkin, :last_checkout

  belongs_to :listing
  has_many :missions, through: :listings

  private

  def first_checkin
    Mission.create!(mission_type: 'first_checkin', date: start_date.to_fs(:db), price: 10)
  end

  def last_checkout
    Mission.create!(mission_type: 'last_checkout', date: end_date.to_fs(:db), price: 5)
  end
end
