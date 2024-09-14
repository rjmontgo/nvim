; extends

; variable (with angled quotes)
; /* html */ `<html>`
; /* sql */ `SELECT * FROM foo`
;(variable_declarator
;	(comment) @injection.language (#offset! @injection.language 0 3 0 -3)
;	(template_string) @injection.content (#offset! @injection.content 0 1 0 -1)
;	)

((comment) @injection.language (#offset! @injection.language 0 3 0 -3)
(raw_string_literal) @injection.content (#offset! @injection.content 0 1 0 -1))
