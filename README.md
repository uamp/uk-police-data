# UK Police Data App

Built for jHub coding scheme by jjohnson
Uses opensource UK police data https://data.police.uk/docs/method/forces/
Deployed as a static page on S3 - http://uk-police-data-app.s3-website.eu-west-2.amazonaws.com/ 
(or via REST: https://uk-police-data-app.s3.eu-west-2.amazonaws.com/index.html)

## To run it inside a docker container 
Easiest option as build tools are installed as required and isolated from your existing development environment.
This docker image is also used inside the github runner to deploy build/deploy the app through github actions (CI/CD)

```
docker-compose up -d --build
```

This will build the container image defined in the Dockerfile with the settings configured in docker-compose.yml
The container will run `npm run serve` internally, which will then serve the app to `localhost:8001`

You can use this same container to build, lint and deploy the app to S3 using the following commands (In order to deploy, AWS credentials need to be in environment when container is built)
```
docker-compose exec -T police-app sh -c "npm run lint"
docker-compose exec -T police-app sh -c "npm run build"
docker-compose exec -T police-app sh -c "npm run deploy"
```

## OR, run it without docker 
Requires node/npm to be installed.
Also @vue/cli needs to be installed globally
(this is of course already included in the container image built above)

### Install pre-requisits
```
npm install
```

### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Deploy to S3 (after build)
This requires AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY & AWS_DEFAULT_REGION to exist in your environment variables
```
npm run deploy
```

## Github CI
CI/CD is achieved through github actions.
In summary, it builds the docker container above, then runs the build and deploy scripts.  
The AWS credentials would be held as github repository secrets, but have been removed for security.
You will notice therefore that this fails at the deploy stage.

