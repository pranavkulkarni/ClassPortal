class Grade < ActiveRecord::Base
  validates :grade, :presence=>true

end
