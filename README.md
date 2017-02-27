# Kinto Webextensions Tests

This repo contains tests used by Firefox Test Engineering for verifying the Kinto stack being used to power [Mozilla's Web Extensions](https://wiki.mozilla.org/WebExtensions)
system. 

## General Configuration

Python 3.6.0 or greater is required.

It's highly recommended to use [Virtualenv](https://virtualenv.pypa.io/en/latest/) to create an isolated Python
environment to run your tests in.

From this directory:

1. `virtualenv . -p /path/to/python`
2. `./bin/activate`
3. `./bin/pip install -r requirements.txt`

This will create your virtual environment, activate it, and then install the required Python package dependencies.

## Running Tests

To run our test suite, use the following command:

`py.test --env=<environment> config-tests/`

where `<environment>` is `stage` or `prod`