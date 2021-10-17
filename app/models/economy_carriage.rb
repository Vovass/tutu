class EconomyCarriage < Carriage
  validates :side_bottom_seats, :side_top_seats, presence: true
end
