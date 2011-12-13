
module Rtre
  class ApproxParams < FFI::Struct
    layout :cost_ins, :int,
           :cost_del, :int,
           :cost_subst, :int,
           :max_ins, :int,
           :max_cost, :int,
           :max_del, :int,
           :max_subst, :int,
           :max_err, :int
  end

  class ApproxMatch < FFI::Struct
    layout :nmatch, :size_t,
           :pmatch, :pointer,
           :cost, :int,
           :num_ins, :int,
           :num_del, :int,
           :num_subst, :int
  end

  # https://github.com/GerHobbelt/libtre/blob/master/lib/tre.h#L78
  class Regex < FFI::Struct
    layout :re_nsub, :size_t,
           :value, :pointer
  end

  # https://github.com/GerHobbelt/libtre/blob/master/lib/tre.h#L83
  class RegMatch < FFI::Struct
    layout :rm_so, :int,
           :rm_eo, :int
  end
end

