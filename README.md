# GRAFANA PLAYGROUND #

I started putting together this small docker-compose stack so I could easily play and start experimenting with Grafana. And you know how these things go: I outgrew the built in _sqlite_ backend, so I moved it to an external Postgres conainer, which I then decided needed an external container backed volume so I could _safely_ persist and move data across lab machines, then it became a matter of what data sources I wanted to experiment with and what data I wanted/could send to the TSDB of choice, and so on.

So, while this is definitely rough around the edges, understand that this is mainly for me. But, if you find it useful, be my guest and fork it and make it your own. Or if you are feeling collaborative, go ahead and contribute and help me extend it and plug in more back ends (Prometheus, InfluxDB, OpenTSDB) or point me to better, sleeker, slimmer metric collection agents.

### Project Description ###
Currently, the project is comprised of the following products:
- **Grafana**
  - This is the main platform highlight
  - https://grafana.com/
  - https://hub.docker.com/r/grafana/grafana/
- **Graphite**
  - A simple but powerful time series database with a pretty solid RESTful API
  - https://graphiteapp.org/
  - https://github.com/hopsoft/docker-graphite-statsd (+StatsD included!)
- **StatsD**
  - StatD falls on the metric aggregation / collector category
  - https://github.com/etsy/statsd
- **Postgres**
  - No brainer alternative to Grafana's built in SQLite3 database
  - https://www.postgresql.org/
  - https://hub.docker.com/_/postgres/
- **himond**
  - Cool, little system metric emmitter for StatsD, written in C++
  - https://github.com/bartoffw/himond
- **Memcached**
  - In-memory key-value store; using this pup to share Grafana session with multiple Grafana container/services
  - https://memcached.org/
  - https://hub.docker.com/_/memcached/
- **HAProxy**
  - Lightweight TCP/HTTP load balancer; handy to scale Grafana behind it and test session persistence
  - http://www.haproxy.org/
  - https://hub.docker.com/r/dockercloud/haproxy/
  - https://github.com/docker/dockercloud-haproxy

### Requirements ###
- Docker 1.13 (tested on Docker 1.13.1)
- Docker Compose 1.14 (tested on Docker Compose 1.14.0)
- Linux Kernel 4.x (tested on Fedora 26 w/4.11.10)

### Instructions ###

If you happen to be on any of the most recent 4.x Linux Kernels, you should be able to just check out this repo and start the stack by running

```bash
$ cd bin && ./start-demo.sh

```

Stopping the stack is as simple as
```bash
$ ./stop-demo.sh
```

### Notes ###
If you find problems, have any suggestions, discover mistakes or typos or, whatever, feel free to open a pull request and / or open an issue. I won't bite --that's what my dogs are for!

### License ###
What license?!

### In the future ###
- [ ] I'd like to add a Docker Swarm equivalent (Stack)
- [x] I'd like to add support for session data to be stored on MemcacheD (more Dockers!)
- [ ] I'd like to ship more backend data sources & test emitters for each
- [ ] Include better, templated dashboards to demo Grafana and the underlying TSDBs