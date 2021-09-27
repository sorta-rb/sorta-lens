# Sorta-lens [![Ruby](https://github.com/sorta-rb/sorta-lens/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/sorta-rb/sorta-lens/actions/workflows/main.yml)
Simple lensing for your data extraction needs

## Usage
Simply instantiate a Lens and start applying it to your objects:
```ruby
  complex1 = { id: 451, .... status: :active }
  complex2 = User.first # has property `id` and method `status`
  lens = Lens.on :id, :status
  lens.(complex1) # => { id: 451, status: :active }
  lens.(complex2) # => { id: 1, status: :online }
```
There is also a typed version:
```ruby
  complex1 = { id: 451, .... status: :active }
  complex2 = { id: 9001, .... status: "online" }
  lens = TypedLens.on id: Integer, status: String
  lens.(complex1) # => TypedLens::TypeError (Unexpected type. Expected String got Symbol)
  lens.(complex2) # => { id: 9001, status: "online" }
```
