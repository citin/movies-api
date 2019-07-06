class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option

  delegate :content, to: :purchase_option

  def alive?
    remaining_time > 0
  end

  private

  # in minutes
  # if is expired return 0
  def remaining_time
    [(expire_date - Time.now).to_i / 1.minute, 0].max
  end

  def expire_date
    (self.created_at + 2.days)
  end
end
