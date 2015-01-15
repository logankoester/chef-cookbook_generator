# Cookbook Generator
> A cookbook generator for Chef.

[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

## Overview

A customized cookbook generator for use with with ChefDK's `chef generate cookbook` command.

## Install

```bash
# If you don't already have the `chef` command on your PATH...
$ gem install chef-dk -v 0.3.6 --no-local-install
$ git clone git@github.com:logankoester/chef-cookbook_generator.git ~/hack/chef/cookbook_generator # ...or wherever
$ echo "chefdk.generator_cookbook = '~/hack/chef/cookbook_generator/code_generator'" > ~/.chef/knife.rb
$ chef generate cookbook <name>
```

## Usage

See `chef generate cookbook --help`

## Author

Copyright (c) 2015 [Logan Koester](http://logankoester.com). Released under the MIT license. See `LICENSE` for details.
