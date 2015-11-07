Instant IPython - Data Analysis
===============================

[IPython Notebook](http://ipython.org/notebook.html) packaged for Heroku. Also includes libraries to get you up and running with data analysis: pandas, statsmodels, scikit-learn, and [ipython-sql](https://github.com/mietek/instant-ipython) to connect to any RDBMS.

**Note:**  There is currently no provision for permanent storage.  All data will be lost on server restart.


Usage
-----


#### Deploying 

You *must* create a new Heroku app with the buildbpack ["heroku-buildpack-scipy"](https://github.com/thenovices/heroku-buildpack-scipy).

Also, the dependencies have been re-arranged in requirements.txt in such a way that eliminates the ["Fortran" error](http://stackoverflow.com/questions/32341732/no-fortran-heroku-scipy-install) when building on Heroku.

```
$ git clone https://github.com/troyshu/instant-ipython-data-analysis.git
$ cd instant-ipython-data-analysis
$ heroku create --buildpack https://github.com/thenovices/heroku-buildpack-scipy
$ git push heroku master
```

Ensure the app is running on at least one dyno, and view the app:

```
$ heroku ps:scale web=1
$ heroku open
```


### Configuration

#### `IPYTHON_PASSWORD`

Set up the `IPYTHON_PASSWORD` environment variable on Heroku to password protect the notebook from unauthorised access.

```
$ heroku config:set IPYTHON_PASSWORD=yourpassword
```

### Other



About
-----

Forked and added stats stuff to by [Troy Shu](http://troyshu.com). Original 'instant-ipython' by [Miëtek Bak](https://mietek.io/).  Published under the [MIT X11 license](https://mietek.io/license/).
