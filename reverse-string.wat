(module
  (memory (export "mem") 1)
 
  (func (export "reverseString") (param $offset i32) (param $length i32) (result i32 i32)
    (local $front i32)
    (local $back i32)
    (local $temp i32)

    (local.set $front (local.get $offset))
    (local.set $back (i32.sub (i32.add (local.get $offset) (local.get $length)) (i32.const 1)))

    (block $block
      (loop $process
        (local.get $front)
        (local.get $back)
        (i32.ge_s)
        (br_if $block)
        
        (i32.store8 (local.get $temp) (i32.load8_u (local.get $front)))
        (i32.store8 (local.get $front) (i32.load8_u (local.get $back)))
        (i32.store8 (local.get $back) (i32.load8_u (local.get $temp)))

        (local.set $front (i32.add (local.get $front) (i32.const 1)))
        (local.set $back (i32.sub (local.get $back) (i32.const 1)))

        (br $process)
      )
    )
    
    (return (local.get $offset) (local.get $length))
  )
)
