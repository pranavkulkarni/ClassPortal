class Enrollment < ActiveRecord::Base
  validates :status, :presence=>true
  has_many :students
  has_many :courses
end
