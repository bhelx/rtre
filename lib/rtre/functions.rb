module Rtre
  module Functions

    # Regex compilation http://laurikari.net/tre/documentation/regcomp/
    attach_function :tre_regcomp, [:pointer, :pointer, :int], :int
    attach_function :tre_regncomp, [:pointer, :pointer, :size_t, :int], :int
    attach_function :tre_regwcomp, [:pointer, :pointer, :int], :int
    attach_function :tre_regwncomp, [:pointer, :pointer, :size_t, :int], :int
    attach_function :tre_regfree, [:pointer], :void

    # Approximate Matching http://laurikari.net/tre/documentation/regaexec/
    attach_function :tre_regaexec, [:pointer, :string, :pointer, ApproxParams, :int], :int
    attach_function :tre_reganexec, [:pointer, :string, :size_t, ApproxParams, :int], :int
    attach_function :tre_regawexec, [:pointer, :pointer, :size_t, ApproxParams, :int], :int
    attach_function :tre_regawnexec, [:pointer, :pointer, :size_t, ApproxParams, :int], :int

  end
end
