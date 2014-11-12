# json2yaml
[![Build Status](https://travis-ci.org/fukayatsu/json2yaml.png)](https://travis-ci.org/fukayatsu/json2yaml)
[![Coverage Status](https://coveralls.io/repos/fukayatsu/json2yaml/badge.png)](https://coveralls.io/r/fukayatsu/json2yaml)
[![Code Climate](https://codeclimate.com/github/fukayatsu/json2yaml.png)](https://codeclimate.com/github/fukayatsu/json2yaml)

Convert between JSON and YAML in CLI

## Installation

    $ gem install json2yaml

## Usage

Now, you can use `json2yaml` and `yaml2json`

### Read from STDIN

```
$ echo '{ "a" : 123 }' | json2yaml
#=>
    ---
    a: 123

$ echo 'a: 123' | yaml2json
#=>
    {"a":123}

$ cat foo.json | json2yaml > foo.yml

$ cat bar.yml | yaml2json > bar.json

```

### Read from files

```
$ json2yaml log1.json log2.json > log.yaml

$ yaml2json log1.yaml log2.yaml > log.json
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
