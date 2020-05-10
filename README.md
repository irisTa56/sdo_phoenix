# sdo_phoenix

## Testing container locally

```shell
$ docker run -it --rm -p 4000:4000 \
  -e SECRET_KEY_BASE="$(mix phx.gen.secret)" \
  -e DATABASE_URL='ecto://postgres:password@host.docker.internal/postgres' \
  test_sdo_phoenix
```

```shell
$ curl -X POST -s \
  -H 'content-type: application/json' \
  -d '{"foo":"bar"}' \
  http://localhost:4000/json
```
