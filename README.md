# sdo_phoenix

## ZAP baseline test

```shell
$ (cd docker && docker-compose up -d --build) \
 && docker run -it --rm -v $(pwd)/test:/zap/wrk \
      --network docker_sdo-phenix owasp/zap2docker-stable \
      zap-baseline.py -c zap-baseline.conf -t http://sdo-phenix:4000/users/
```
