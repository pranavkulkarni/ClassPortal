require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "student should be valid" do
    stud = Student.new(:name => "testStud", :email => "test@gmail.com", :password=> "test1")
    assert stud.save
  end

  test "validation checks should fail" do
    # No name
    stud = Student.new( :email => "test@gmail.com", :password=> "test1")
    assert_not stud.valid?

    # No email ID
    stud = Student.new(:name => "testStud", :password=> "test1")
    assert_not stud.valid?

    # No password
    stud = Student.new(:name => "testStud", :email => "test@gmail.com")
    assert_not stud.valid?
  end

  test "duplicate emailID accounts should not get created" do
    studA = Student.new(:name => "testUserA", :email => "test@gmail.com", :password=> "testA")
    studA.save
    studB = Student.new(:name => "testUserB", :email => "test@gmail.com", :password=> "testB")
    assert_not studB.save
  end




end
