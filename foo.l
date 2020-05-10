(de foo ()
   (t (prinl "A_A")
      (prinl "o o")
      (prinl ">v<") ) )

(de bar (X Y) (list Y X))

(de baz () (1 2 3))

(setq "PROMPT" "What is your name?")
(setq "GREETING" "Hello")

(de "say-greet" (Name)
   (prinl "GREETING" ", " Name "!") )

(de greet ()
   (prin "PROMPT" " ")
   (setq Answer (line T))
   ("say-greet" Answer)
   T )

(class +Foo)
# attr

(dm T (Attr) (=: attr Attr))

(dm string> () (pack "string: " (: attr)))
