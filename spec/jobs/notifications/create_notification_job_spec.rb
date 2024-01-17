require 'rails_helper'

RSpec.describe Notifications::CreateNotificationJob, :job do
  let(:notification) { attributes_for(:notification) }
  let(:model) { "Notifications::InApp".constantize }

  it 'queues the job' do
    expect { Notifications::CreateNotificationJob.perform_later(model, notification) }
      .to have_enqueued_job
      .with(model, notification)
      .on_queue("notifications")
  end

  it 'is in notifications queue' do
    expect(Notifications::CreateNotificationJob.new.queue_name).to eq('notifications')
  end

  it 'executes perform' do
    expect(Notifications::CreateNotificationJob.perform_now(model, notification)).to be_truthy
  end
end
