class Student < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true

end