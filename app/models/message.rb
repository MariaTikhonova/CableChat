class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  def timestamp
  	created_at.strftime('%H:%M:%S %d %B %Y')
  end
  after_create_commit { MessageBroadcastJob.perform_later(self)}
  validates :body, presence:true, length: {minimum:2, maximum 1000}
end
