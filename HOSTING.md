# Hosting BBC-A11y

A convenient way of testing your web app's BBC Accessibility Standards
compliance over time is to host an instance of
[pa11y-dashboard](https://github.com/springernature/pa11y-dashboard).

## Hosting pa11y-dashboard

pa11y-dashboard is an open source accessibility dashboard that is used to
automate testing of accessibility standards and track test results over time.
It consists of two separate web apps:

  * [pa11y-webservice](https://github.com/springernature/pa11y-webservice)
    exposes a REST API for running standards checks using
    [phantomjs](http://phantomjs.org/) and recording results in a
    [mongo](https://www.mongodb.org/) database.

  * [pa11y-dashboard](https://github.com/springernature/pa11y-dashboard) is
    a front-end UI for exploring the results of accessibility
    standards checks over time.

The pa11y-dashboard app can be deployed either with an embedded
pa11y-webservice, or independently. In the example below we deploy them as two
separate heroku apps connected over the internet.

## Example: Deploying to Heroku

We've made a few tweaks to the pa11y apps to make it possible to deploy them to
[12 factor](http://12factor.net/) hosting environments like
[heroku](http://heroku.com). We're hoping these changes are merged into pa11y,
but until then, you can deploy these forks of pa11y to heroku, specifically the
`bbc-a11y` branches, like this:

```
git clone https://github.com/joshski/pa11y-webservice
cd pa11y-webservice
heroku create your-pa11y-webservice
heroku buildpacks:set https://github.com/datamail/heroku-buildpack-nodejs-phantomjs.git
git push heroku bbc-a11y:master
cd ..

git clone https://github.com/joshski/pa11y-dashboard
cd pa11y-dashboard
heroku create your-pa11y-dashboard
git push heroku bbc-a11y:master
cd ..
```

With these two heroku apps deployed, you can connect the dashboard app
to the web service app:

```
cd pa11y-dashboard
heroku config:set WEBSERVICE_URL=https://your-pa11y-webservice.herokuapp.com/
cd ..
```
(n.b. the trailing slash is important)

Finally, you need to provision a mongodb database. In this example, I'm using
[mLab](https://devcenter.heroku.com/articles/mongolab) (still known by heroku as
`mongolab`):

```
cd pa11y-webservice
heroku addons:create mongolab
```

This will set a new environment variable in heroku, exposing a mongodb
database URL for your pa11y web service to connect to:

```
heroku config

=== your-pa11y-webservice Config Vars
MONGOLAB_URI: mongodb://your-mongodb-url
```

However, `pa11y-webservice` requires an environment variable called
`DATABASE_URL`, so you need to copy the value of `MONGOLAB_URI`:

```
heroku config:set DATABASE_URL=mongodb://your-mongodb-url
```

Your dashboard should now be up and running at
`http://your-pa11y-dashboard.herokuapp.com`. 

If you want to allow registering new jobs via the web dashboard, you'll need to
explicitly enable this:

```
heroku config:set READONLY=false
```
