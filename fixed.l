(class +Fixed)
# value scale

(dm T (Value Scale)
   (=: value Value)
   (=: scale Scale) )

(de fixed (Value Scale)
   (default Value 0 Scale 0)
   (new '(+Fixed) Value Scale) )

(dm format> ()
   (format (: value) (: scale)) )

(dm scale-up> (ScaleInc)
   (if (gt0 ScaleInc)
      (scale-up> (fixed (* (: value) 10) (inc (: scale))) (dec ScaleInc))
      This) )

(dm scale-down> (ScaleDec)
   (if (gt0 ScaleDec)
      (scale-down> (fixed (/ (: value) 10) (dec (: scale))) (dec ScaleDec))
      This) )

(dm normalize> ()
   (cond
      ((=0 (: scale)) This)
      ((=0 (: value)) (fixed 0 0))
      ((=0 (% (: value) 10))
         (normalize>
            (fixed (/ (: value) 10) (dec (: scale)))))
      (T This) ) )

(de fixed+ (A B)
   (let (First (> (get A 'scale) (get B 'scale))
         Larger (if First A B)
         Smaller (ifn First A B)
         LargerScale (get Larger 'scale)
         ScaleDiff (- LargerScale (get Smaller 'scale))
         ScaledSmaller (scale-up> Smaller ScaleDiff) )
      (normalize>
         (fixed
            (+ (get Larger 'value) (get ScaledSmaller 'value))
            LargerScale) ) ) )

(de fixed- (A B)
   (ifn B
      (fixed (- (get A 'value)) (get A 'scale))
      (fixed+ A (fixed- B)) ) )

(de fixed* (A B)
   (normalize>
      (fixed
         (* (get A 'value) (get B 'value))
         (+ (get A 'scale) (get B 'scale)) ) ) )

(de fixed-square (A) (fixed* A A))