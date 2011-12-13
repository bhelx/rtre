require "rtre/version"
require 'ffi'

module Rtre
  extend FFI::Library
  ffi_lib 'tre'

  attach_function :tre_regcomp, [:pointer, :pointer, :int], :int
  attach_function :tre_regncomp, [:pointer, :pointer, :size_t, :int], :int
  attach_function :tre_regerror, [:int, :pointer, :pointer, :size_t], :size_t
  attach_function :tre_regfree, [:pointer], :void
end
