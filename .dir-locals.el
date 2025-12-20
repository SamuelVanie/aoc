;;; Directory Local Variables            -*- no-byte-compile: t -*-
;;; For more information see (info "(emacs) Directory Variables")

((nil . ((projectile-project-compilation-cmd . ("cobc -x %s -o ../out/%s"))
	 (eval . (progn
		   (require 'lsp)
		   (add-to-list 'lsp-language-id-configuration '(cobol-ts-mode . "cobol"))
		   (add-to-list 'lsp-language-id-configuration '(".*\\.cob" . "cobol"))
		   (lsp-register-client
		    (make-lsp-client :new-connection
				     (lsp-stdio-connection
				      '("cobol-language-support" "pipeEnabled" "-Dline.separator=\r\n" "-Dlogback.statusListenerClass=ch.qos.logback.core.status.NopStatusListener" "-DserverType=NATIVE"))
				     :priority 4 :activation-fn (lsp-activate-on "cobol")
				     :server-id 'cobol-lsp)))))))
