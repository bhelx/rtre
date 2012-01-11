require 'spec_helper'

describe Rtre do

  before :all do
    class String
      include Rtre::StringMethods
    end
  end

  it "should find and bind the libtre c functions" do
    methods = Rtre.methods

    methods.should include :tre_regcomp
    methods.should include :tre_regncomp
    methods.should include :tre_regwcomp
    methods.should include :tre_regwncomp
    methods.should include :tre_regfree

    methods.should include :tre_regaexec
    methods.should include :tre_reganexec
    methods.should include :tre_regawexec
    methods.should include :tre_regawnexec
  end

  it "should work" do
    match = "This is a test string".ascan("test")

    match[:rm_so].should == 10
    match[:rm_eo].should == 14
  end

  it "should work with one char missing" do
    match = "This is a test string".ascan("tet", :max_del => 1)

    match[:rm_so].should == 10
    match[:rm_eo].should == 12
  end

end


