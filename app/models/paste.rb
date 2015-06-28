class Paste < ActiveRecord::Base
  validates :name, presence: true
  validates :contents, presence: true
end
