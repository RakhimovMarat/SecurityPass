# frozen_string_literal: true

class Pass < ApplicationRecord
  validates :visitor_firstname, presence: true
  validates :visitor_lastname,  presence: true
  validates :visit_date,        presence: true
  validates :user_id,           presence: true

  belongs_to :user

  enum :status, { created: 0, approved: 1, rejected: 2, finished: 3, canceled: 4 }, default: :created

  def status_i18n
    I18n.t("activerecord.attributes.pass.status.#{status}")
  end

  def self.ransackable_associations(_auth_object = nil)
    ['user']
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value identity_document remark status updated_at user_id visit_date
       visitor_company visitor_firstname visitor_lastname]
  end
end
