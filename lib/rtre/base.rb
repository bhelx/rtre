module Rtre
  extend FFI::Library
  ffi_lib 'tre'

  #https://github.com/GerHobbelt/libtre/blob/master/lib/tre.h#L109
  # POSIX tre_regcomp() flags.
  REG_EXTENDED = 1
  REG_ICASE = (REG_EXTENDED << 1)
  REG_NEWLINE = (REG_ICASE << 1)
  REG_NOSUB = (REG_NEWLINE << 1)

  # Extra tre_regcomp() flags.
  REG_BASIC = 0
  REG_LITERAL = (REG_NOSUB << 1)
  REG_RIGHT_ASSOC = (REG_LITERAL << 1)
  REG_UNGREEDY = (REG_RIGHT_ASSOC << 1)

  # POSIX tre_regexec() flags.
  REG_NOTBOL = 1
  REG_NOTEOL = (REG_NOTBOL << 1)

  # Extra tre_regexec() flags.
  REG_APPROX_MATCHER = (REG_NOTEOL << 1)
  REG_BACKTRACKING_MATCHER = (REG_APPROX_MATCHER << 1)

  # Rtre constants
  COMPILATION_DEFAULTS = [REG_EXTENDED, REG_NOSUB]

end

