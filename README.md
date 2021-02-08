# m3db-compose
m3db cluster as docker compose

Note: This is, obviously, a demonstration of m3db cluster in a docker-compose environment, please dont use it in prod or sth

## Deploy

1. Download the m3db binaries (you can change the version in the `Makefile`)

   `make all`

2. Run the docker compose environment

   `docker-compose up -d`

This will spawn 3 m3db nodes cluster (cluster as in able to reach each others and the embedded etcd form a cluster), a coordinator, a promeetheus and a grafana

3. Once all containers are running, bootstrap the m3db cluster using the bootstrap.sh script (modify parameters when needed)

   `./bootstrap.sh <coordinator_ip>`

   I didnt expose any port outside of the docker network because there is a lot of ports to handle, you can search for the IP of the container using `docker inspect <coordinator_container_id>` or some well formatted `docker ps` command

4. If you didnt have any error in the output nor the logs of the m3db node containers then you are good to go. The given prometheus config already points its remote_write API
   into the coordinator and will push its data into the m3db cluster (you may need to wait for prometheus to fill its WAL and create the first block to be pushed, I tried to force it to 30min)

5. Open the grafana dashboard at <grafana_container_ip>:3000, Add the prometheus datasource (you can use `prometheus` for the prometheus hostname) and import the m3db dashboard from https://grafana.com/grafana/dashboards/8126. Prometheus is pre configured to pull metrics from m3db nodes and the coordinator and you should see some interesting metrics

Cheers.

PS: Apparently M3 introduced some breaking changes in minor versions which not a good practice, the config in the article https://medium.com/@sayfeddinehammemi/m3db-cluster-as-a-prometheus-long-term-storage-dfbbb1f6aeb8 does not work for newer version of m3db, better start with the config from this repo

PS2: There is a kubernetes operator for m3db, if you are planning to use m3db in the prod better look for it.
