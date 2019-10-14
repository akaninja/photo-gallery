class Album < ApplicationRecord
  has_many_attached :photos

  validates :title, presence: { message: "Título não pode ficar em branco" }
end
