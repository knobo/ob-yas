(require 'ob)

(defvar org-babel-default-header-args:yas '())

(defun org-babel-execute:yas (body params)
  "Execute a block of yas code.
This function is called by `org-babel-execute-src-block'."  

  (let ((key (rest (assoc :key params)))
        (mode (intern (rest (assoc :mode params))))
        (name (rest (assoc :name params)))
        (condition (rest (assoc :condition params)))
        (group (rest (assoc :group params)))
        (expand-env (rest (assoc :expand-env params)))
        (file (rest (assoc :file params)))
        (binding (rest (assoc :binding params)))
        (uuid (rest (assoc :uuid params))))

    (yas--update-template
     (yas--table-get-create mode)
     (yas--define-snippets-2
      (yas--table-get-create mode)
      key body name condition group expand-env file binding uuid)))
  "Done")

(defun org-babel-prep-session:yas (_session params)
  "Return an error if the :session header argument is set."
  (error "no session for yas"))

(provide 'ob-yas)
