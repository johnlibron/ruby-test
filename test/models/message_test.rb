require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test 'invalid without sender' do
    message = Message.new
    refute message.valid?
    assert_not_nil message.errors[:sender]
  end

  test 'invalid without recipient' do
    message = Message.new
    refute message.valid?
    assert_not_nil message.errors[:recipient]
  end

  test 'invalid without message_id' do
    message = Message.new
    refute message.valid?
    assert_not_nil message.errors[:message_id]
  end

  test 'invalid without unique message_id' do
    hex_string = SecureRandom.hex
    Message.create(message_id: "#{hex_string}@domain.com")
    message = Message.new(message_id: "#{hex_string}@domain.com")
    refute message.valid?
    assert_not_nil message.errors[:message_id]
  end
end
