Form.IO
-------

Form objects suck.


Hand-rolled forms suck because you always need to roll multi-model forms,
nested-forms, virtual attributes, error-propagation, etc., __yourself__.

Existing form libraries take a good stab at these problems, but generally
take on too much responsibility. They encourage you to use the same form object
for both reading and writing data. The result is code where it is difficult
to understand whether you're in a reading or writing context.

The problem compounds when you add the additional responsibilities of saving
underlying model(s) and performing side effects.

We want simpler form objects, focused on a narrower set of responsibilities.

That's where **Form.io** comes in

# Data flows

It's clear that forms have 2 basic data flows:

## User input -> form object -> model
This is the **in-data** flow, used for **writing** data.

When writing, forms have 2 basic purposes:
* Validating user input
* Normalizing user input

## Model -> form object -> display to user
This is the **out-data** flow, used for **displaying** data.

When displaying, forms have 1 purpose:
* Normalizing persisted input for display to user

# Field Transformers

```ruby
# For use in create/update actions
class PhoneWriter < FormIO::InTransformer

  # The form object will see this version of the attribute internally.
  # Sets @value

  # User input -> form object.
  def value=(phone)
    @value = phone.gsub('-', '').gsub(' ', '')
  end

  # form object -> model
  def value
    # default returns @value
  end
end
```

```ruby
# For use in edit action
class PhoneReader < FormIO::OutTransformer

  # form object -> display to user
  def value
    format_phone_number(@value)
  end

  # model -> form object
  def value=(phone)
    # defaults to @model.<value>
  end
end
```
