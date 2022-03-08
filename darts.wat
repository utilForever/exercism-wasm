(module
  (memory (export "mem") 1)
 
  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $mult_result_x f32)
    (local $mult_result_y f32)
    (local $dist f32)

    (local.set $mult_result_x (f32.mul (local.get $x) (local.get $x)))
    (local.set $mult_result_y (f32.mul (local.get $y) (local.get $y)))
    (local.set $dist (f32.add (local.get $mult_result_x) (local.get $mult_result_y)))

    (if
      (f32.le (local.get $dist) (f32.const 1.0))
      (return (i32.const 10))
    )

    (if
      (f32.le (local.get $dist) (f32.const 25.0))
      (return (i32.const 5))
    )

    (if
      (f32.le (local.get $dist) (f32.const 100.0))
      (return (i32.const 1))
    )

    (return (i32.const 0))
  )
)
