class User < ApplicationRecord
  before_create :assign_random_id

  private

  def assign_random_id
    self.id ||= SecureRandom.random_number(1000)
  end
end
