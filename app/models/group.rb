# frozen_string_literal: true

class Group < ApplicationRecord
  include ImageUploader::Attachment(:icon)

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :entities_groups, dependent: :destroy
  has_many :entities, through: :entities_groups, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, too_short: 'Group name must be more than 3 characters long' }

  def icon_url
    if icon.attached?
      Rails.application.routes.url_helpers.url_for(icon)
    else
      # Return the URL of a default icon image or a placeholder image
      # if no icon is attached to the group.
      # Example:
      ActionController::Base.helpers.asset_path('default_icon.png')
    end
  end
end
