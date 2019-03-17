class Passenger < ApplicationRecord
  belongs_to :reservation, inverse_of: :passengers
  has_many :flights, through: :reservations
  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :name, presence: true, length: { maximum: 50 }

private

    def downcase_email
      email.downcase!
    end

end
