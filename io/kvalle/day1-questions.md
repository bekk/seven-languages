### Evaluate `1+1` and then `1 + "one"`. Is Io strongly typed or weakly typed? Support your answer with code.

```io
Io> 1 + 1
==> 2
Io> 1 + "one"

  Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
  ---------
  message '+' in 'Command Line' on line 1
```

Io is obviously strongly typed.

### Is 0 `true` or `false`? What about the empty string? Is `nil` `true` or `false`? Support your answer with code.

`true`, `true`, and `false`, respectively.

```io
Io> true and 0
==> true
Io> true and ""
==> true
Io> true and nil
==> false
```

### How can you tell what slots a prototype supports?

By using the `slotNames` method on `Object`:

```io
Io> Car slotNames
==> list(drive, type)
```

### What is the difference between `=` (equals), `:=` (colon equals), and `::=` (colon colon equals)? When would you use each one?

* `=` is used for assignments to existing slots. Will raise exception if the slot does not exis.
* `:=` is used to assign a value to an existing slot, *or* create the slot if it does not exist.
* `::=` does the same as `:=`, but will in addition create a setter for the slot.

According to the [user guide](http://www.iolanguage.com/scm/io/docs/IoGuide.html), the assignments evaluates to the following:

```io
a ::= 1  # newSlot("a", 1)
a := 1   # setSlot("a", 1)
a = 1    # updateSlot("a", 1)
```

