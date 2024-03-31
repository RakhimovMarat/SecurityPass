class CancelExpiredPassJob < ApplicationJob
  queue_as :default

  def perform
    Pass.where("visit_date + INTERVAL '1 day' < ?", Time.now).where.not(status: :finished).update_all(status: :canceled)
  end
end
