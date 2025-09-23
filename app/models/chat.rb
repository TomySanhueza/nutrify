class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  has_many :messages, dependent: :destroy
end
