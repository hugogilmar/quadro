# Quadro

This project rocks and uses MIT-LICENSE.

---

Quadro is a CMS written for Rails developers. It works as an engine and provides the standard functionality to start a website or a blog from the scratch.

With Quadro you have the following features:

- Create pages.
- Create your own templates.
- Make any area on your template editable with the *quadro widget*.
- Generate a sitemap.xml automatically.
- Upload images for each page, even a cover.
- Use *summernote* as content editor.
- Slider with *slick* carousel.
- Image gallery with *lightbox2*.
- Integrate any *Bootstrap 3* template.
- *Google Maps* integration through *gmaps*.

## Current stable version

Current stable version.

[![Gem Version](https://badge.fury.io/rb/quadro.png)](https://badge.fury.io/rb/quadro)

## Code Climate and Travis CI status

[![Code Climate](https://codeclimate.com/github/hugogilmar/quadro/badges/gpa.svg)](https://codeclimate.com/github/hugogilmar/quadro)
[![Test Coverage](https://codeclimate.com/github/hugogilmar/quadro/badges/coverage.svg)](https://codeclimate.com/github/hugogilmar/quadro/coverage)
[![Build Status](https://travis-ci.org/hugogilmar/quadro.svg?branch=master)](https://travis-ci.org/hugogilmar/quadro)

## Installation

In order to start using it, you need to add the gem entry on your *Gemfile*.

```ruby
gem "quadro"
```

Then you need to run your bundler.

```bash
bundle install
```

Now the last step is to run the installer.

```bash
rails g quadro:install
```

## Configuration

It will add a mountable route on your project *routes.rb*.

The default user is *quadro@example.com* and its password *quadro123*.

You will need to set the *application.yml* file under the *config* directory on your project.

## Using the widget

By default, all templates are written with *Haml*. In order to use the widget, you need to do it as the following example:

```ruby
= widget_for :content
```

It also works with a default HTML block.

```ruby
= widget_for :content do
  %p Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
```

The *widget_for* helper receives a second parameter which is *type*.

```ruby
= widget_for :content, type: :html
```

In this release, the possible options are:

- html (default)
- slider
- gallery
- map

Map widget options are:

- latitude (required)
- longitude (required)
- title (optional)
- static (optional)

*Note: `static` option displays a JPEG graphic map instead of traditional. Default value is false.*

Content block will be used for location's pin info window if provided.

```ruby
= widget_for :address, type: :map, latitude: 13.701291, longitude: -89.224423 do
  %p Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
```

You also need to set `google_maps_api_key` on `config/application.yml`.

*Note: to get an API key, please refer to Google Maps official documentaion [here](https://developers.google.com/maps/documentation/javascript/get-api-key#get-an-api-key).*

## Working with page templates

Every page has a template associated to it, it sets the layout that will be displayed on the browser. There is a default list of available templates by default.

- blank (full width content)
- jumbotron (full width content with cover header)
- sidebar (content with sidebar navigation)
- demo (an example layout with an example of all available widgets)

You can create your own templates, just add the template files as *partials* in the following path:

```bash
app/views/quadro/shared/templates
```

## Global configuration options

Quadro global configuration options are defined at `config/application.yml`. Here a description for each of them:

- host (url with schema)
- name (site name)
- author (page author default)
- layout (sub page list layout, use *list* or *thumbnail*)
- template (page template default)
- frequency (sitemap.xml default)
- priority (sitemap.xml default)
- google_maps_api_key

*Note: as page templates, sub page list layout can be added at:*

```bash
app/views/quadro/pages/page
```

## Use it and enjoy it

Now when you log in into the *Quadro CMS* you will find a *toolbar* fixed at the bottom, to manage your new website or blog.

Now you are ready to get started with Quadro CMS.
