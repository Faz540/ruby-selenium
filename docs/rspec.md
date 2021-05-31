# RSpec Cheat Sheet:

## Equivalence & Comparisons
```ruby
    expect(actual).to eql(expected) # passes if actual.eql?(expected)
    expect(actual).not_to eql(not_expected) # passes if not(actual.eql?(expected))
    expect(actual).to be >  expected
    expect(actual).to be >= expected
    expect(actual).to be <= expected
    expect(actual).to be <  expected
    expect(actual).to be_within(delta).of(expected)
```

## Truthiness
```ruby
    expect(actual).to be_truthy   # passes if actual is truthy (not nil or false)
    expect(actual).to be true     # passes if actual == true
    expect(actual).to be_falsy    # passes if actual is falsy (nil or false)
    expect(actual).to be false    # passes if actual == false
    expect(actual).to be_nil      # passes if actual is nil
    expect(actual).to_not be_nil  # passes if actual is not nil
```

## Expecting errors
```ruby
    expect { ... }.to raise_error
    expect { ... }.to raise_error(ErrorClass)
    expect { ... }.to raise_error('message')
    expect { ... }.to raise_error(ErrorClass, 'message')
```

## 
```ruby
    expect(actual).to contain_exactly(expected_element1, expected_element2)
    expect(actual).to include(expected)
```