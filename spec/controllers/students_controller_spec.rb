require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  setup do
    @student = Student.new(email: "foo@gmail.com", studentid: "1234567", first_name: "Joe", last_name: "Gaucho")
    @student.save
    @request.env['HTTP_REFERER'] = 'http://test.com/1/courses'
    post :add_course, :id => @student.id, :course_id => 1
  end

  it "should add the course successfullly" do
    expect(response.status).to eq(200)
  end
end
