# Eyemask

Eyemask allows you to generate rich documentation from your Cucumber specs. It works by taking the output of the JSON formatter and applying a [Liquid](http://liquidmarkup.org/) template to it. The result can be as simple as a plain text or Markdown file, or as complex as an HTML file ready to be rendered into PDF.

The purpose of Eyemask is to make it easy to maintain living documentation that can be used by the whole team -- from developers to designers to client stakeholders -- no matter whether they're more verbal or visual. It is based on some of the ideas of [Rich Pictures](http://en.wikipedia.org/wiki/Rich_picture) from soft systems research.

Eyemask assumes that the description blocks for features and scenarios (the plain text before any other content) are marked up using a variant of Markdown. We support running those blocks through Liquid, to allow template authors to use a powerful set of tags. These tags include `{% uml %}`, allowing you to embed UML diagrams using [PlantUML's syntax](http://plantuml.sourceforge.net/index.html).

This tool is still in its early days, and will evolve substantially as it is used in the wild. Please help us improve it by submitting feature requests, bug reports, and pull requests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eyemask'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eyemask

## Usage

Eyemask is designed to be used as part of a larger toolchain. Its most basic operation takes a JSON file and outputs a Markdown file to `STDOUT`.

    $ eyemask process cucumber.json

We also support taking the JSON from `STDIN` by using `-` as the file name:

    $ cat cucumber.json | eyemask process -

You can specify a custom template by providing the `--template` option:

    $ eyemask process cucumber.json --template="path/to/template.html"

There are also some more built-in templates that can be used by refering to their name. For example, the [Prince XML](http://www.princexml.com/) template can be invoked as follows:

    $ eyemask process cucumber.json --template=princexml

It also supports customisation via *parameters*. There are four primary parameters: title, subtitle, logo, and authors. These become top-level variables available to the template:

    $ eyemask process cucumber.json --title="My Title Here"

You can also set custom parameters by passing a `--params` option. The parameters take the form 'key':'value':

    $ eyemask process cucumber.json --params=my_param:"My Value" my_other_param:2

This list of options is likely to grow as we expand the use-cases of the tool.

## Coming soon

Here are some of the features that are planned for the future (in no particular order):

- More and improved named default templates to make Eyemask more powerful out of the box.

- Introductory materials as Markdown, to explain more about the project.

- Providing textual syntaxes for more diagram types, including charts, for when you want to reduce the cost of change.

- Tags for footnotes, pullquotes, sidebars, sidenotes, and 'story cards'. 

- Index and flexible, configurable Table of Contents generation (probably based on a similar 'two-pass' approach as used by LaTeX).

- Default metadata, such as the date and time of preparation.

- Additional standard metadata params, such as version, client, project, and copyright.

## UML diagrams

Eyemask supports rich UML diagrams, for those occasions when a visual is the best way to explain a feature. This uses the [PlantUML](http://plantuml.sourceforge.net/index.html) command-line tool. To use this functionality, download the PlantUML JAR and create a shell script called `plantuml`, in your `PATH`, that executes the JAR passing all parameters.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/wearefriday/eyemask/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
