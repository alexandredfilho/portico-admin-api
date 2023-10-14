require 'test_helper'

class DeliveriesMailerTest < ActionMailer::TestCase
  test 'delivery_completed' do
    mail = DeliveriesMailer.delivery_completed
    assert_equal 'Delivery completed', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
