# Kinto Webextensions Tests

This repo contains tests used by Firefox Test Engineering for verifying the Kinto stack being used to power [Mozilla's Web Extensions](https://wiki.mozilla.org/WebExtensions)
system. 


## General Configuration

Please install the following tools:

* Python 3.6 or greater
* [pipenv](https://pipenv.readthedocs.io/en/latest/)

To create a virtual environment and activate it, please use the following commands:

1. `pipenv install`
2. `pipenv shell`


## Running Tests

To run our test suite, use the following command:

`py.test --env=<environment> config-tests/`

where `<environment>` is `stage` or `prod`