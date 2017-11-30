FROM python:alpine
RUN apk add --update bash make gcc git python3-dev musl-dev libffi-dev openssl-dev
WORKDIR /src
COPY . /src
RUN pip3 install pipenv
RUN pipenv install --system
CMD pytest --env=$TEST_ENV -v config-test/
