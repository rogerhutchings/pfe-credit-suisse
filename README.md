# PFE with full config

## How to use

1. Create a `.env` file, based on `env-example`, and fill in the values for your setup.
1. Run the container to build PFE, passing in your env file:
    ```sh
    docker build . -t pfe-credit-suisse
    docker run pfe-credit-suisse --env-file .env
    ```
1. Access the volume at `/src/dist` to get the compiled production files.

## Example usage

```sh
mkdir tmp
docker build . -t pfe-credit-suisse
docker run -t -i --mount type=bind,src="$(pwd)"/tmp,dst=/src/dist --env-file ./env pfe-credit-suisse
cd tmp
python -m SimpleHTTPServer 8000
```

For more one-line http servers, take a look at https://gist.github.com/willurd/5720255

## Configuration

The following environment variables are used to configure the app during the build process, and need to be passed in when running the container:

- `PANOPTES_API_HOST` - url to the Panoptes API
- `PANOPTES_API_APPLICATION` - application ID for the Panoptes API
- `TALK_HOST` - url to the Talk API
- `SUGAR_HOST` - url to the Sugar server
- `STAT_HOST` - url to the stats server

**All of these need to be set explicitly, or they may fall back to their Zooniverse defaults with unintended consequences.**
