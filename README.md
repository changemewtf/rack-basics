# How to use

To run `.rb` files:

```
bundle exec ruby 01-Hello_World.rb
```

To run `.ru` files:

```
bundle exec rackup config.ru
```

To run `.rb` files with `rackup`:

```
bundle exec rackup -I . -r 01-Hello_World.rb -b "run Application.new"
```

Please note that the default port is 8080 if you run with `ruby`
and 9292 if you run with `rackup`.
