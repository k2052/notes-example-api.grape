eAn example API app using Grape.

## Deploying

### Locally

    $ bundle install
    $ foreman start

### On Heroku

    $ heroku create

Add a MongoDB service; its configured to support MongoLab or MongoHQ, but you can easily add support for another provider in 
_config/initializers/db.rb_

    $ heroku addons:add mongohq

Or:

    $ heroku addons:add mongolab

Then deploy:

    $ git push heroku master

If you want to test everything is working you can seed with test data:

    $ heroku run bundle exec rake seed
    $ http GET http://appnae.herokuapp.com/notes/1 X-Token:TestKey 

And you should get back:

        HTTP/1.1 200 OK
        Connection: keep-alive
        Content-Length: 48
        Content-Type: application/json

        {
            "notes": [
                {
                    "id": "1", 
                    "title": "Jogging in park"
                }
            ]
        }

Just make sure to remove the test key afterwards:

    $ bundle exec unseed

*Note*: Unseed will destroy all data!

### On Dokku

First setup MongoDB:

    $ git clone https://github.com/jeffutter/dokku-mongodb-plugin.git /var/lib/dokku/plugins/mongodb
    $ dokku plugins-install

Then just add your dokku remote and push.

## Tests

### Rspec

    $ bundle exec rake seed RACK_ENV=test
    $ bundle exec rspec

### Dredd

    $ bundle exec rake seed 
    $ foreman start
    $ dredd -h "X-Token: TestKey" apiary.apib http://localhost:9292

*Note:* You have to seed before every Dredd test as Dredd will delete sample data it needs for tests to pass. 
