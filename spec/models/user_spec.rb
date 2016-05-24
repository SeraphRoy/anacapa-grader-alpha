require 'spec_helper'

describe User do
	before do
		@user = User.new
		@user.save
	end

	it "should have an is_admin method" do
		expect(@user).to respond_to(:is_admin)
	end

	it "should have return false if we haven't set the role" do
		expect(@user.is_admin).to be(false)
	end

	it "should have return false if we haven't set the role" do
		@user.add_role "admin"
		expect(@user.is_admin).to be(true)
	end

  it "shouldn't have the ability to crud Course if we haven't set the role" do
    ability = Ability.new(@user)
    expect(ability.can? :crud, Course).to eq(false)
  end

  it "shouldn't have the ability to crud Student if we haven't set the role" do
    ability = Ability.new(@user)
    expect(ability.can? :crud, Student).to eq(false)
  end

  it "should be able to crud Course if is an instructor" do
    @user.add_role "instructor"
    ability = Ability.new(@user)
    expect(ability.can? :crud, Course).to eq(true)
  end

  it "should be able to crud Student if is an instructor" do
    @user.add_role "instructor"
    ability = Ability.new(@user)
    expect(ability.can? :crud, Student).to eq(true)
  end

end

