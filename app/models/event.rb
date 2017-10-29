class Event < ApplicationRecord
  #attr_accessible :title, :public_event, :description, :orchestra, :press_articles, :press_articles_attributes, :event_dates, :event_dates_attributes

  validates :title, :orchestra, :presence => true

  has_many :press_articles, :dependent => :destroy
  has_many :event_dates, :dependent => :destroy

  accepts_nested_attributes_for :press_articles
  accepts_nested_attributes_for :event_dates
end
