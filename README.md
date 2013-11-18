# Json2yaml

Json <==> Yaml in CLI

## Installation

Add this line to your application's Gemfile:

    gem 'json2yaml'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json2yaml

## Usage

```
$ echo '{ "a" : 123 }' | json2yaml

$ cat foo.json | json2yaml > foo.yml

$ cat bar.yml | yaml2json > bar.json

```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
