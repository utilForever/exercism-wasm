(module
  (func $squareOfSum (export "squareOfSum") (param $max i32) (result i32)
    (local $val1 i32)
    (local $ret i32)

    (local.set $val1 (local.get $max))
    (local.set $val1 (i32.add (local.get $val1) (i32.const 1)))
    
    (local.set $ret (local.get $max))
    (local.set $ret (i32.mul (local.get $ret) (local.get $val1)))
    (local.set $ret (i32.div_s (local.get $ret) (i32.const 2)))
    (local.set $ret (i32.mul (local.get $ret) (local.get $ret)))

    (return (local.get $ret))
  )

  (func $sumOfSquares (export "sumOfSquares") (param $max i32) (result i32)
    (local $val1 i32)
    (local $val2 i32)
    (local $ret i32)

    (local.set $val1 (local.get $max))
    (local.set $val2 (local.get $max))
    (local.set $val1 (i32.add (local.get $val1) (i32.const 1)))
    (local.set $val2 (i32.mul (local.get $val2) (i32.const 2)))
    (local.set $val2 (i32.add (local.get $val2) (i32.const 1)))

    (local.set $ret (local.get $max))
    (local.set $ret (i32.mul (local.get $ret) (local.get $val1)))
    (local.set $ret (i32.mul (local.get $ret) (local.get $val2)))
    (local.set $ret (i32.div_s (local.get $ret) (i32.const 6)))

    (return (local.get $ret))
  )

  (func (export "difference") (param $max i32) (result i32)
    (local $val1 i32)
    (local $val2 i32)
    (local $ret i32)
    
    (local.set $val1 (call $squareOfSum (local.get $max)))
    (local.set $val2 (call $sumOfSquares (local.get $max)))

    (local.set $ret (i32.sub (local.get $val1) (local.get $val2)))
    (return (local.get $ret))
  )
)
