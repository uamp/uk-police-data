# UK Police Data App

Built for jHub coding scheme by jjohnson
Uses opensource UK police data https://data.police.uk/docs/method/forces/
Deployed as a static page on S3 - https://uk-police-data-app.s3.eu-west-2.amazonaws.com/index.html

## To run with docker-compose (easiest option)
```
docker-compose up -d --build
```

Then navigate to `localhost:8001`



## Or, run it without docker (requires node/npm to be installed)

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
The AWS credentials would be held as github secrets, but have been removed for security.  THIS IS FOR DEMONSTRATION PURPOSES ONLY.

