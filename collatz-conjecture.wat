(module
  (func (export "steps") (param $number i32) (result i32)
    (local $is_odd i32)
    (local $cnt i32)

    (i32.le_s (local.get $number) (i32.const 0))
    (if
      (then
        (return (i32.const -1))
      )
    )

    (i32.eq (local.get $number) (i32.const 1))
    (if
      (then
        (return (i32.const 0))
      )
    )
    
    (local.set $cnt (i32.const 0))
    
    (loop $calculate
      (i32.eq (i32.rem_s (local.get $number) (i32.const 2)) (i32.const 0))
      (if
        (then
          (local.set $number (i32.div_s (local.get $number) (i32.const 2)))
        )
        (else
          (local.set $number (i32.add (i32.mul (local.get $number) (i32.const 3)) (i32.const 1)))
        )
      )

      (local.set $cnt (i32.add (local.get $cnt) (i32.const 1)))

      (local.get $number)
      (i32.const 1)
      (i32.ne)
      (br_if $calculate)
    )

    (return (local.get $cnt))
  )
)