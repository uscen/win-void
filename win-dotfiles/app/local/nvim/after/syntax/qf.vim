"""         ╔═════════════════════════════════════════════════════════╗
"""         ║     Extend syntax to include additional qf keywords     ║
"""         ╚═════════════════════════════════════════════════════════╝
syntax match qfLineNr   "[^|]*"   contained contains=qfError,qfWarning,qfNote,qfInfo
syntax match qfError    "error"   contained
syntax match qfWarning  "warning" contained
syntax match qfNote     "note"    contained
syntax match qfInfo     "info"    contained

" Link new syntax to DiagnosticSign highlight groups.
highlight! default link qfError     DiagnosticError
highlight! default link qfWarning   DiagnosticWarn
highlight! default link qfNote	    DiagnosticHint
highlight! default link qfInfo	    DiagnosticInfo
