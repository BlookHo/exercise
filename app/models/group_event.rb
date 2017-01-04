class GroupEvent < ApplicationRecord
  belongs_to :users

  before_save :value_stop_time

  validates_associated :users

  validates :user_id, :start, :duration, :name, presence: true, on: [:create, :update]
  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :stop_cannot_be_less_start, :start_cannot_be_in_the_past
  validates :published, :deleted, inclusion: { in: [true, false] }
  validates :location, :name, length: { maximum: 50 }

  # time managing

  def start_cannot_be_in_the_past
    errors.add(:start, "can't be in the past") if start.present? && start <= Date.today
  end

  def stop_cannot_be_less_start
    errors.add(:stop, "can't be less than start time") if stop.present? && stop < start
  end

  def value_stop_time
    self.stop = start + duration.days
  end

  # delete managing

  def delete_event
    update_attribute(:deleted, true)
  end

  # publish managing

  def publish_event
    has_nils? ? self.errors.add(:base, "Event can not be published - has nil in fields") : update(published: true)
  end

  def has_nils?
    attributes.values.include?(nil)
  end

  # Markdown

  class << self
    def markdown
      Redcarpet::Markdown.new(Redcarpet::Render::HTML, escape_html: true)
    end
  end

  before_save :assign_markdown_description, if: -> { description_changed? }

  def assign_markdown_description
    assign_attributes({ markdown_description: self.class.markdown.render(description) })
  end

end
