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
- Use *summernote* as editor.
- Integrate any *Bootstrap 3* template.

In order to start using it, you need to add the gem entry on your *Gemfile*.

`gem "quadro", git: "https://github.com/hugogilmar/quadro.git"`

Then you need to run your bundler.

`bundle install`

Now the last step is to run the installer.

`rails g quadro:install`

It will add a mountable route on your project *routes.rb*.

The default user is *quadro@example.com* and its password *quadro123*.

You will need to set the *application.yml* file under the *config* directory on your project.

By default, all templates are written with *Haml*. In order to use the widget, you need to do it as the following example:

`= widget_for :content do
%p Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.`

Now when you log in into the *Quadro CMS* you will find a *toolbar* fixed at the bottom, to manage your new website or blog.

I hope you will find this gem helpful.
