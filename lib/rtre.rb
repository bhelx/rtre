require 'ffi'

require "rtre/version"
require "rtre/base"
require "rtre/structs"
require "rtre/functions"

module Rtre

  module StringMethods

    def ascan(pattern, opts=nil)
      pattern = pattern.to_s if pattern.is_a? Regexp
      ap = Rtre.approx_params(opts)

      ptr = FFI::MemoryPointer.from_string(pattern)
      regex_ptr = FFI::MemoryPointer.new :pointer, Rtre::Regex.size
      worked = Rtre.tre_regcomp(regex_ptr, ptr, Rtre.comp_flags(opts))
      regex = Rtre::Regex.new regex_ptr

      match_ptr = FFI::MemoryPointer.new :pointer, Rtre::ApproxMatch.size
      match = Rtre::ApproxMatch.new match_ptr
      match[:nmatch] = regex[:re_nsub] + 1

      match[:pmatch] = FFI::MemoryPointer.new Rtre::RegMatch, match[:nmatch]

      worked = Rtre.tre_reganexec(regex_ptr, self, self.size, match_ptr, ap, Rtre.match_flags(opts))

      puts "Workd #{worked}"

      Rtre::RegMatch.new match[:pmatch]
    end

  end
end
