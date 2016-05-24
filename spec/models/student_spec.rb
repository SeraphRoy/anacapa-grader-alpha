require 'rails_helper'

RSpec.describe Student, type: :model do
  before do
    @student = Student.new
    @student.save
    @params = ActionController::Parameters.new(email: "foo@gmail.com", studentid: "1234567", first_name: "Joe", last_name: "Gaucho")
  end

  it "should get the student" do
    expected_student = Student.new(email: "foo@gmail.com", studentid: "1234567", first_name: "Joe", last_name: "Gaucho")
    student = Student.get_student @params
    expect(student.studentid).to eql(expected_student.studentid)
  end

  it "should alert the invalid first name" do
    params = ActionController::Parameters.new(email: "foo@gmail.com", studentid: "1234567", last_name: "Gaucho")
    student = Student.new_student params
    expected_student = "The student must have a first name."
    expect(student).to eql(expected_student)
  end

  it "should alert the invalid last name" do
    params = ActionController::Parameters.new(email: "foo@gmail.com", studentid: "1234567", first_name: "Joe")
    student = Student.new_student params
    expected_student = "The student must have a last name."
    expect(student).to eql(expected_student)
  end

  it "should alert the invalid email address" do
    params = ActionController::Parameters.new(studentid: "1234567", first_name: "Joe", last_name: "Gaucho")
    student = Student.new_student params
    expected_student = "The student must have an email address."
    expect(student).to eql(expected_student)
  end

  it "should alert the invalid student id" do
    params = ActionController::Parameters.new(email: "foo@gmail.com", first_name: "Joe", last_name: "Gaucho")
    student = Student.new_student params
    expected_student = "The student must have a student id."
    expect(student).to eql(expected_student)
  end

  it "should return the correct student" do
    student = Student.new_student @params
    expected_student = Student.new(email: "foo@gmail.com", studentid: "1234567", first_name: "Joe", last_name: "Gaucho")
    expect(student.studentid).to eql(expected_student.studentid)
  end

end
