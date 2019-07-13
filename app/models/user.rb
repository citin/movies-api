class User < ApplicationRecord

  has_many :purchases

  def library
    self.purchases.select {|p| p.alive? }.sort_by(&:remaining_time_in_minutes)
  end

  # check by title
  def is_in_library?(content)
    library.any? {|purchase| purchase.content.title == content.title }
  end
end
