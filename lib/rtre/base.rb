module Rtre
  module Functions
    extend FFI::Library
    ffi_lib 'tre'
  end
end

