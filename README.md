# sdo_phoenix

## Testing container locally

```shell
$ cd docker
$ docker-compose up -d
$ curl -X GET http://localhost:4000/json
$ curl -X POST \
  -H 'content-type: application/json' \
  -d '{"foo":"bar"}' \
  http://localhost:4000/json
$ docker-compose down
```
