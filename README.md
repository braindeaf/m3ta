# M3ta

Writing meta tags can be awkward. M3ta attempts to make light work of configuring defaults that are reused on every page and giving as much flexibility as possible to append and modify those defaults on each request whether it is in a controller or view.

## Installation

Add it to this line to your application's Gemfile:

```ruby
gem "m3ta"
```

And then execute:
```bash
bundle install
```

## Usage

Meta tags can be configured in multiple different ways. You can set defaults in to ways


Via an initializer

```ruby
M3ta.defaults do |b|
  b.title = 'Some blog post'
  b.image =  'https://robl.me/braindeaf.png'
end
```

Via I18n locales

```yaml
en:
  m3ta:
    site_name: RobL Vs...
    description: I write thems code
```

Each request has access to a *m3ta::Builder* object to append data to.

* Controllers

```ruby
class ApplicationController < ActionController::Base
  m3ta do |b|
    b.title = 'A better title'
    b.description = %(...and then it will be over and that'll be alright with me...)
  end
end
```

```ruby
class ProjectsController < ApplicationController
  m3ta do |b|
    b.title = 'Sometimes dead is better'
  end
end
```

* Views

```ruby
:ruby
  m3ta.tap do |b|
    b.title = %(Thundercats are better than Gobots)
    b.description = "#{b.description} - J.R. Hayes"

```

```ruby
<%=
  m3ta.tap do |b|
    b.title = %(Thundercats are better than Gobots)
    b.description = "#{b.description} - J.R. Hayes"
  end
%>
```

Finally you can render your Meta Tags with a single helper in the application layout

```ruby
!!!
  %head
    = m3ta_tags
  %body
```

## Contributing
If you wish to contribute please feel free to fork the repo and submit a PR.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
