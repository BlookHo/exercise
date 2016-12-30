class ApplicationRecord < ActiveRecord::Base
  include ActiveModel::Serialization

  self.abstract_class = true
end
