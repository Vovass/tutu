class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, :top_seats, :bottom_seats, presence: true

  default_scope { order(:number)} # сортировка по умолчанию по номеру

  scope :economy, -> { where(type: 'EconomyCarriage')}
  scope :coupe, -> { where(type: 'CoupeCarriage')}
end
