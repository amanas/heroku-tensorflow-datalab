IPython datalab with TensorFlow
===============================

[IPython Notebook](http://ipython.org/notebook.html) packaged for Heroku + [pgcontents](https://github.com/quantopian/pgcontents) for persistent file storage. Also includes libraries to get you up and running with data analysis: pandas, statsmodels, scikit-learn, Google TensorFlow, and [ipython-sql](https://github.com/mietek/instant-ipython) to connect to any RDBMS.


Installation
-----

### Heroku app creation

You *must* create a new Heroku app with the buildbpack ["heroku-buildpack-scipy"](https://github.com/thenovices/heroku-buildpack-scipy).


```
$ git clone https://github.com/amanas/heroku-tensorflow-datalab.git
$ cd heroku-tensorflow-datalab
$ heroku create --buildpack heroku/python
```

### Configure pgcontents

pgcontents allows persistent storage of ipython notebooks, files, etc. via a PostgreSQL database.

1) Decide on a database for pgcontents to use. If you already have a database attached (e.g. DATABASE_URL), you can use it, although it is recommended that you create a new database for pgcontents so no data is accidentally overwritten.

If you decided to create a new database for pgcontents:
```
$ heroku addons:create heroku-postgresql:hobby-dev
```

2) In "ipython_notebook_config.py", change DATABASE_URL to the appropriate environment variable if the database you decided to use for pgcontents in step 1 is different.

### Configure `IPYTHON_PASSWORD`

Set up the `IPYTHON_PASSWORD` environment variable on Heroku to password protect the notebook from unauthorized access.

```
$ heroku config:set IPYTHON_PASSWORD=yourpassword
```

### Deploy

```
$ git push heroku master
```

### Finish configuring pgcontents

Open up bash on your app server, and run "pgcontents init" to finish setting up pgcontents and running the necessary database migrations. When prompted, enter the url (e.g. postgresql://...) of the database you decided to use for pgcontents in step 1 of "Configure pgcontents". 
```
$ heroku run bash
$ ~$ pgcontents init
```

### You're done

Ensure the app is running on at least one dyno, and view the app:
```
$ heroku ps:scale web=1
$ heroku open
```


About
-----

BTW: open for new challenges (remote atm)

Added TensorFlow by [Andrés Mañas](https://uk.linkedin.com/in/andresmanas)

Forked,  'instant-ipython-data-analysis' by [Troy Shu](http://troyshu.com). 

Original 'instant-ipython' by [Miëtek Bak](https://mietek.io/).  Published under the [MIT X11 license](https://mietek.io/license/).

