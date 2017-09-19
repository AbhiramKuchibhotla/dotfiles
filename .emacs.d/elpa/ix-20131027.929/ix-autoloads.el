;;; ix-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "ix" "../../../../../.emacs.d/elpa/ix-20131027.929/ix.el"
;;;;;;  "aa600b0aa3c25332989473b922167eac")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/ix-20131027.929/ix.el

(autoload 'ix-delete "ix" "\
Delete a post, this requires you to be logged in. Specify the
   post id or the url

\(fn IX-URL)" t nil)

(autoload 'ix "ix" "\
Paste the region at http://ix.io, url returned is saved to the
   kill ring. It is recommended to set up a username and token by
   configuring the variables `ix-user' and `ix-token'

\(fn START END)" t nil)

(autoload 'ix-browse "ix" "\
Browse a paste from http://ix.io, given an input of either a
   post identifier or the complete url. The output is displayed in a
   special buffer, *ix*. If the buffer needs to be saved for some reason
   it has to be done manually

\(fn IX-URL)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/ix-20131027.929/ix-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/ix-20131027.929/ix.el") (22966
;;;;;;  11945 472585 799000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ix-autoloads.el ends here
