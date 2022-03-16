(module
  (func (export "isLeap") (param $year i32) (result i32)
    (i32.eq (i32.rem_s (local.get $year) (i32.const 4)) (i32.const 0))
    (if
      (then
        (i32.ne (i32.rem_s (local.get $year) (i32.const 100)) (i32.const 0))
        (if
          (then
            (return (i32.const 1))
          )
        )
      )
    )

    (i32.eq (i32.rem_s (local.get $year) (i32.const 400)) (i32.const 0))
    (if
      (then
        (return (i32.const 1))
      )
    )

    (return (i32.const 0))
  )  
)
