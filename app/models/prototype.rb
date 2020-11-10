class Prototype < ApplicationRecord
  belongs_to :user
  has_many :Prototypes
end
