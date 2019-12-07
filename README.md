# PFE with full config

## How to use

1. Create a `.env` file, based on `env-example`, and fill in the values for your setup.
1. Run the container to build PFE, passing in your env file:
    ```sh
    docker build . -t pfe-credit-suisse
    docker run pfe-credit-suisse --env-file .env
    ```

## Example usage

```sh
mkdir tmp
docker build . -t pfe-credit-suisse
docker run -t -i --mount type=bind,src="$(pwd)"/tmp,dst=/src/dist --env-file ./env pfe-credit-suisse
```
