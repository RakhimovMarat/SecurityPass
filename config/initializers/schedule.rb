require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '1m' do
  CancelExpiredPassJob.perform_later
end
