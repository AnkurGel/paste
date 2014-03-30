Paste
=====

## About

Paste is a [Gist](http://gist.github.com)/[Pastie](http://pastie.org) like application in Ruby on Rails.

It uses the following approach:

* Any anonymous user can create a paste in any language.
* **Autoselection of language** from the filename entered by the user, for instance:
    + If user enters `foo.rb`, language will be automatically selected as `Ruby`
    + If user enters `bar.js` language will be selected as `Javascript`

* Uses [Pygments](http://pygments.appspot.com/) API for syntax-highlightion. To perform this, it follows the following approach:
    + As soon as the user submits his paste, send him to the paste's `show` page, instead of waiting for response from `Pygments`. At this point, if the _highlighted-code_ is not present(which will be mostly the case), the user will just saw the _raw_ code.
    + Perform pygmentation in background, using `delayed_job`.
    + At client side, keep polling(by sending `AJAX` requests) to check for presence of highlighted-code every second. As soon as highlighting process is complete, the polling will fetch the highlighted code as `JSON` response.
    + **Asynchronously** replace raw-code with highlighted-code.

    + This makes the process very fast, user-friendly and seamless :)

* Sign-ins with [`GitHub`](http://github.com), a signed up user will have paste under his account like: `/ankurgel/1df3fd`.

* **Forking support**. A user can easily fork other users' or anonymous' pastes.

* Integration with [Gist](http://gist.github.com) (pending)


## Installation ##

* Fork the repository
* Register [GitHub Application](https://github.com/settings/applications/new) to enable GitHub signup support. Save `GITHUB_KEY` and `SECRET_SECRET` in your _environment variables_, using:

```shell
export GITHUB_KEY=YOUR_GITHUB_KEY
export GITHUB_SECRET=YOUR_GITHUB_SECRET
```
You can also save it in your `bashrc` file or setup it in your `config/initializers`

* Setup as:

```shell
bundle install
rake db:migrate
rake db:seed
foreman start
rails server
```

## Contribution ##

There is huge scope for improvements and new features. I will gradually implement them and update this repository. Also, tests are to be covered (yeah, kill me! But this was weekends spree). Feel free to help me out :)

* Fork the repo
* Make changes.
* Submit as [pull-request](https://github.com/ankurgel/paste/pulls).

You can make suggestions by creating [new issue](https://github.com/ankurgel/paste/issues)

Cheers
