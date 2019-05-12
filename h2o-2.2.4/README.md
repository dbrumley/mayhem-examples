# Mayhem on h2o 2.2.4

This runs Mayhem on the h2o webserver, a high performance webserver.
 - Source: https://github.com/h2o/h2o
 - Manual: https://h2o.examp1e.net/index.html
 - Mayhem Trophy: https://github.com/h2o/h2o/issues/1775

To run, forwarding port 80 inside docker to 8083 on your host:
```
$ docker run  -p 8083:80 dbrumley/h2o-2.2.4
```
