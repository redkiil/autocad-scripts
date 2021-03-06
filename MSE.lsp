(setq *slope* "2x10")
(setq *msename* "MEIOSE")
(defun c:mse()
  	(command "undo" "begin")
  	(setq sel1 (ssget))
  	(princ "setup")
  	(progn
		(setq i 0)
    		(setq tmp (getstring (strcat "\nRelacao < " *slope* ">: ")))
	  	(if (= tmp nil)
		 (setq tmp *slope*)
		)
	  	(if (= tmp "")
		 (setq tmp *slope*)
		)
	  	(setq lname (getstring (strcat "\nNome Layer < " *msename* ">: ")))
	  	(if (= lname nil)
		 (setq lname *msename*)
		)
	  	(if (= lname "")
		 (setq lname *msename*)
		)
	  	(setq *slope* tmp)
	  	(setq *msename* lname)
	  	(princ (strcat "\nRelacao" tmp))
	  	(setq tmp2 tmp)
	  	(setq tmprmae (substr tmp 1 1))
	  	(setq tmpvao (substr tmp2 3))
	  	(princ (strcat "\nRMAE:" tmprmae "RVAO:" tmpvao))
	  	(setq resto (+ (atoi tmpvao) (atoi tmprmae)))
	  	(while (setq ent (ssname sel1 i))
		(if (< (rem i resto) (atoi tmprmae))
		(progn
		  	(command "_.chprop" ent "" "_layer" lname "_c" "ByLayer" "")
			(princ " ")
		  	(prin1 i)
		  )
		 )
		(setq i (1+ i))
	  	)
	)
  	(command "undo" "end")
)