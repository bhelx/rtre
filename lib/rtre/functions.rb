module Rtre
  # Regex compilation http://laurikari.net/tre/documentation/regcomp/
  attach_function :tre_regcomp, [:pointer, :pointer, :int], :int
  attach_function :tre_regncomp, [:pointer, :pointer, :size_t, :int], :int
  attach_function :tre_regwcomp, [:pointer, :pointer, :int], :int
  attach_function :tre_regwncomp, [:pointer, :pointer, :size_t, :int], :int
  attach_function :tre_regfree, [:pointer], :void

  # Approximate Matching http://laurikari.net/tre/documentation/regaexec/
  attach_function :tre_regaexec, [:pointer, :string, :pointer, ApproxParams, :int], :int
  attach_function :tre_reganexec, [:pointer, :string, :size_t, :pointer, ApproxParams, :int], :int
  attach_function :tre_regawexec, [:pointer, :pointer, :size_t, ApproxParams, :int], :int
  attach_function :tre_regawnexec, [:pointer, :pointer, :size_t, ApproxParams, :int], :int

  attach_function :tre_regaparams_default, [:pointer], :int

  def self.approx_params(opts)
    ap_ptr = FFI::MemoryPointer.new :pointer, Rtre::ApproxParams.size
    Rtre.tre_regaparams_default(ap_ptr)
    ap = Rtre::ApproxParams.new ap_ptr
    return ap unless opts

    if opts.has_key? :fuzziness
      ap[:max_cost] = opts[:fuzziness]
      return ap
    end

    ap.load(opts)
    ap
  end

  def self.comp_flags(opts)
    return 0 unless opts and opts.has_key? :comp_flags
    opts[:comp_flags]
  end

  def self.match_flags(opts)
    return 0 unless opts and opts.has_key? :match_flags
    opts[:match_flags]
  end
end
