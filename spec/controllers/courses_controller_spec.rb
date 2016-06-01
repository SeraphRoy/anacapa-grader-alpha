require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "manage student roster" do
    setup do
      @request.env['HTTP_REFERER'] = 'http://test.com/1/roster'
      let!(:course) {Course.create(:dept => "Comp Science", :num => "111", :desc => "Blah", :term => "S16")}
      @student = ActionController::Parameters.new(email: "foo@gmail.com", studentid: "1234567", first_name: "Joe", last_name: "Gaucho")
      post :add_student, :student => @student, :id => course.id
    end

    it "shoud add student to a course" do
      # student = Student.new(email: "foo@gmail.com", studentid: "1234567", first_name: "Joe", last_name: "Gaucho")
      # student.save
      #response.should be_success
      #flash[:notice].should eq("fail")
      # response.should redirect_to(:action => "back")
    end
  end
end
