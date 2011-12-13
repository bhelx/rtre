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

  it "should work" do
    str = "Hello"
    ptr = FFI::MemoryPointer.from_string(str)
    regex_ptr = FFI::MemoryPointer.new :pointer, Rtre::Regex.size

    worked = Rtre::Functions.tre_regcomp(regex_ptr, ptr, 1)
    worked.should == 0

    regex = Rtre::Regex.new regex_ptr

    match_ptr = FFI::MemoryPointer.new :pointer, Rtre::RegMatch.size
    match = Rtre::ApproxMatch.new match_ptr
    match[:nmatch] = regex[:re_nsub] + 1
    match[:pmatch] = FFI::MemoryPointer.new :pointer, Rtre::ApproxMatch.size*match[:nmatch]

    ap = Rtre::ApproxParams.new
    ap[:cost_ins] = 1
    ap[:cost_del] = 1
    ap[:cost_subst] = 1
    ap[:max_ins] = 1
    ap[:max_del] = 1
    ap[:max_subst] = 1
    ap[:max_err] = 1

    strng = "Hell World"
    worked = Rtre::Functions.tre_reganexec(regex_ptr, strng, strng.size, match_ptr, ap, 1)

    puts worked
    puts "cost #{match[:cost]}"

  end
end


