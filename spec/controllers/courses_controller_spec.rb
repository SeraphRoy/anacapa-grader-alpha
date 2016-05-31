require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "manage student roster" do
    setup do
      @student = ActionController::Parameters.new(email: "foo@gmail.com", studentid: "1234567", first_name: "Joe", last_name: "Gaucho")
      student = Student.new(email: "foo@gmail.com", studentid: "1234567", first_name: "Joe", last_name: "Gaucho")
      student.save
      let!(:course) {Course.create(:dept => "Comp Science", :num => "111", :desc => "Blah", :term => "S16")}
      @request.env['HTTP_REFERER'] = 'http://test.com/sessions/new'
      post :add_student, :student => @student, :id => course.id
    end

    it "shoud add student to a course" do
      response.should be_success
    end

  end
end
