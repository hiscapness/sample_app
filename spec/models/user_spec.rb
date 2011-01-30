require 'spec_helper'

describe User do
  before(:each) do
    @attr = {:name => "The Dude", :email => "dude@abides.org"}
  end
  
  it "should create a valid instance given appropriate attributes" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    @attr[:name] = ""
    user_no_name = User.new(@attr)
    user_no_name.should_not be_valid
  end
  
  it "should require an email" do
    @attr[:email] = ""
    user_no_email = User.new(@attr)
    user_no_email.should_not be_valid
  end
  
  it "should reject names that are too long" do
    name = "a" * 51
    @attr[:name] = name
    user_long_name = User.new(@attr)
    user_long_name.should_not be_valid
  end
  
  it "should reject email addresses that are in the wrong format" do
    addr = %w['funny@','b@g', 'foo.bar.doo@d', 'doo.foo@big', 'user_at_foo.org']
    addr.each do |address|
        @attr[:email] = address
        user_w_bad_email = User.new(@attr)
        user_w_bad_email.should_not be_valid
    end
  end
  
  it "should accept email addresses that are in the right format" do
    addr = %w['funny@die.com','b@g.com', 'foo.bar.doo@d.com', 'doo.foo@big.com', 'user@foo.org']
    addr.each do |address|
        @attr[:email] = address
        user_w_bad_email = User.new(@attr)
        user_w_bad_email.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses"do
    #create and commit a user
    User.create!(@attr)
    u1 = User.new(@attr) # create another one with the same email address
    u1.should_not be_valid    
  end
  
  it "should reject duplicate emails based on case too" do
    @attr[:email] = 'FOO.bar@baz.ORG'
    User.create!(@attr)
    @attr[:email] = @attr[:email].upcase
    u1 = User.new(@attr)
    u1.should_not be_valid
  end
end
