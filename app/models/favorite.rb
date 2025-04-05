class Favorite < ApplicationRecord
  belongs_to :business
  belongs_to :developer

  # Validation for uniqueness on the model layer
  validates :business_id, uniqueness: { scope: :developer_id }

  # Adds a favorite record
  def self.favorite!(business, developer)
    find_or_create_by(business:, developer:)
  end

  # Removes the favorite record if it exists
  def self.unfavorite!(business, developer)
    find_by(business:, developer:)&.destroy
  end

  # Checks if the favorite record exists
  def self.favorited?(business, developer)
    exists?(business:, developer:)
  end
end
