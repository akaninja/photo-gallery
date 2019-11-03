class Album < ApplicationRecord
  has_many_attached :photos
  enum status: { exclusive: 0, shared: 10 }
  validates :title, presence: { message: "Título não pode ficar em branco" }
end
