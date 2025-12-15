;;; Directory Local Variables            -*- no-byte-compile: t -*-
;;; For more information see (info "(emacs) Directory Variables")

((nil . ((eval . (enable-lsp-bridge))
	 (eval . (when (boundp 'lsp-bridge-single-lang-server-mode-list)
		   (add-to-list 'lsp-bridge-single-lang-server-mode-list
				'((cobol-mode cobol-ts-mode) . "cobol-language-support"))))
	 (eval . (when (boundp 'lsp-bridge-single-lang-server-extension-list)
		   (add-to-list 'lsp-bridge-single-lang-server-extension-list
				'(("cbl" "cob" "cpy") . "cobol-language-support"))))
	 )))
