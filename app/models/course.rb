class Course < ActiveRecord::Base
  validates :courseNumber, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true
  validates :instructor, :presence => true
  validates :startDate, :presence => true
  validates :endDate, :presence => true

end
