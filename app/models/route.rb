class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :name, presence: true
  validate :station_count

  before_validation :set_name

  private

  def set_name
    self.name = self.name.empty? ? "#{railway_stations.first.title} - #{railway_stations.last.title}" : self.name
  end

  def station_count
    errors.add(:base, "Route should contain more than 2 stations") if railway_stations.size < 2
  end
end
