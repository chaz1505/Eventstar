class Event < ActiveRecord::Base
belongs_to :user
has_many :guests
accepts_nested_attributes_for :guests 
end
