# okta-flask-sample

## How-To with Pipenv 

```
$ pipenv install

$ pipenv shell


$ flask run                                                                
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)

```

## How-To with Docker

```
## view/edit Dockerfile

## build image
docker build -t okta_flask .

# run container
docker container run --env-file ../okta-flask.env --name okta_flask --detach --publish 5000:5000 okta_flask:latest
```

```
## where okta-flask.env
CLI_OKTA_CLIENT_ID=<okta-client-id-here>
CLI_OKTA_CLIENT_SECRET=<okta-client-secret-here>
CLI_OKTA_ORG_URL=https://dev-01234567.okta.com/

```

## How-To with Podman

```
## view/edit Dockerfile

## build image
podman build -t okta_flask .

# run container
podman run -d --name okta_flask --restart unless-stopped --publish 5000:5000 \
-e CLI_OKTA_CLIENT_ID=okta-client-id-here \
-e CLI_OKTA_CLIENT_SECRET=okta-client-secret-here \
-e CLI_OKTA_ORG_URL=https://dev-01234567.okta.com/ \
okta_flask:latest

```


```
## access container
curl http://127.0.0.1:5000

```

```
## teardown container
docker container rm -f $(docker container ls -aq -f name=okta_flask) 

## teardown image
docker image rm -f $(docker image ls -aq -f reference='okta_flask*')

```

## All Credits Go To:

Okta dev doc pages:

https://developer.okta.com/docs/guides/sign-into-web-app-redirect/python/main/

github repo:

https://github.com/okta-samples/okta-flask-sample

##
