class GroupEvent < ApplicationRecord
  belongs_to :users

  before_save :value_stop_time

  validates_associated :users

  validates :user_id, :start, :duration, :name, presence: true, on: [:create, :update]
  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :stop_cannot_be_less_start, :start_cannot_be_in_the_past
  validates :published, :deleted, inclusion: { in: [true, false] }
  validates :location, :name, length: { maximum: 30 }

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

  # time managing

  def start_time
    self.start
  end

  def stop_time
    self.stop
  end

  def start_cannot_be_in_the_past
    errors.add(:start_time, "can't be in the past") if start_time.present? && start_time <= Date.today
  end

  def stop_cannot_be_less_start
    errors.add(:stop_time, "can't be less than start time") if stop_time.present? && stop_time < self.start
  end

  def value_stop_time
    self.stop = start_time + self.duration.days
  end

  # special methods

  def delete_event
    self.update_attribute(:deleted, true)
  end


  def publish_event
    self.update(published: true) unless have_nils?
  end

  def have_nils?
    self.attributes.values.include?(nil)
  end

end
