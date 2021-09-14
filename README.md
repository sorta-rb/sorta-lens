# Sorta-lens
Simple lensing for your data extraction needs
## Usage

```ruby
  complex1 = {id: 451, .... status: :active }
  complex2 = User.first # has property `id` and method `status`
  lens = Lens.on :id, :status
  lens.(complex1) # => { id: 451, status: :active }
  lens.(complex2) # => { id: 1, status: :online }
```