class GroupEventSerializer < ActiveModel::Serializer
  belongs_to :users

  attributes :id, :user_id, :start, :stop, :duration, :name, :description, :markdown_description, :location, :published, :deleted
end
