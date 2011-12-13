require 'spec_helper'

describe Rtre::Functions do
  it "should find and bind the libtre c functions" do
    methods = Rtre::Functions.methods

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
end


