class Message < ApplicationRecord
    validates :sender, :recipient, :message_id, presence: true
end
