###What is feed_simple?

feed_simple converts the RSS feed at http://www.macleans.ca/multimedia/feed/ to a json feed.


###Local Installation

```shell
$ git clone https://github.com/milewdev/feed_simple.git ~/work/feed_simple
$ cd ~/work/feed_simple
$ bundle install --without production
$ rbenv rehash
$ rake db:migrate
```


###Usage

```shell
$ cd ~/work/feed_simple
$ rake feed_simple:load
$ rails server &
$ curl -w "\n" http://localhost:3000
{"rss":{"version":"2.0","xmlns:content"...
$ fg
^C
$
```

The feed_simple:load task should be run say once every hour using something like
[cron](http://en.wikipedia.org/wiki/Cron) or [Heroku
Scheduler](https://devcenter.heroku.com/articles/scheduler).


###Code Notes

The application was created using [rails-api](https://github.com/rails-api/rails-api)
and therefore serves json responses.  It works as follows:

- rake task feed_simple:load deletes all records from the Contents table,
retrieves XML data from the RSS feed url, converts the XML to JSON, and stores
it in the json field of a new record added to the Contents table

- controller contents_controller exposes just the index action; index retrieves
the contents of the json field from the first record in the Contents table and
renders the json as the body of the response with a content type of
application/json


###Release Notes

####v1.0.0
- Initial release.
