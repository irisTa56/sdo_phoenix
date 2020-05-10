# sdo_phoenix

## Testing container locally

```shell
$ cd docker
$ docker-compose up -d
$ curl -X GET http://localhost:4000/jsons
$ curl -X POST \
  -H 'content-type: application/json' \
  -d '{"foo":"bar"}' \
  http://localhost:4000/jsons
$ docker-compose down
```
