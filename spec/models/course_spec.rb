require 'rails_helper'

RSpec.describe Course, type: :model do
  before do
    @course = Course.new(dept: "Computer Science", num: "111", term: "S16")
    @course.save
  end

  it "should produce the correct format" do
    output = @course.course_slug
    expect(output).to eq("Computer Science111_S16")
  end

  it "should upload with no problem" do
    extend ActionDispatch::TestProcess
    @file = fixture_file_upload('files/success.csv', 'text/csv')
    failed = @course.import @file
    expect(failed).to eq([])
  end

  it "should upload with no problem" do
    extend ActionDispatch::TestProcess
    @file = fixture_file_upload('files/fail.csv', 'text/csv')
    failed = @course.import @file
    expect(failed).to eq([{"email"=>"foo@gmail.com", "first_name"=>"Joe", "last_name"=>"Gaucho"}])
  end

  it "should export with no problem" do
    extend ActionDispatch::TestProcess
    @file = fixture_file_upload('files/success.csv', 'text/csv')
    failed = @course.import @file
    csv_out = @course.export
    expect(failed).to eq([])
    expect(csv_out).to eq("studentid,email,first_name,last_name\n1234567,foo@gmail.com,Joe,Gaucho")
  end
end
