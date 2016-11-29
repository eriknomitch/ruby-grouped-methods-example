# Ruby Grouped (Instance) Methods Example

This is solely a proof of concept.

## Purpose

When a class passes a certain threshold of complexity, method structure and naming can start to become a bit overwhelming. Most likely, some sets of methods will appear that can be though of as a part of a "group" (i.e., they all pertain to the same thing but are in the same class).

Naming can become taxing and potentially ugly:

```Ruby

class Foo

  # ...

  def bars_with_bazs
    # ...
  end

  def merge_baz_with_bars(baz)
    # ...
  end

  def delete_selected_bars(selected)
    # ...
  end

end
```

**Grouped methods allow you to structure and execute this more cleanly and clearly.**

Since all of these methods pertain to `bars`, we can group them as follows:

```Ruby

class Foo

 define_grouped_method :bars, :with_bazs do
   # ...
 end

 define_grouped_method :bars, :merge_baz do |baz|
  # ...
 end

 define_grouped_method :bars, :deleted_selected do |selected|
   # ...
 end

```

**Now, they can be cleanly found, executed, and remembered as follows:**

```Ruby

foo = Foo.find(123)

foo.bars.with_bazs
foo.bars.merge_baz(baz)
foo.bars.deleted_selected(selected)

```

Compare that with the first example would have required:

```Ruby

foo = Foo.find(123)

foo.bars_with_baz
foo.merge_baz_with_bar(baz)
foo.delete_selected_bars(selected)

```

## Running This Example

```shell
$ bundle install

$ ruby main.rb
```
