## About

Forked form [ad3ller/elog-docker](https://github.com/ad3ller/elog-docker). Update it to newest debian container.

The Dockerfile creates a docker image of an [elog](https://elog.psi.ch/elog/) server built on Debain (stable).  

The example configuration file creates 3 logbooks: Experiment, Hardware, and Simulation.

## Docker image
Pull the Dockerfile from github
```
git clone --recursive https://github.com/zeauw/elog-docker
cd ./elog-docker
```

Edit elog.conf to suit your needs and then build the docker image
```
docker build -t elog .
```

## Example usage

An example for podman compose is in the repo (compose.yml).

## Notes
In the example config, Latex math can be rendered using [MathJax](https://www.mathjax.org/).  This recognises inline math `$ ... $` and numbered equations `\being{equation} ... \end{equation}` in elog entries.

SMTP (email notification) is not tested (and very probably doesn't work).

## Warning
SSL is not supported. Passwords sent over the network are vulnerable to sniffing attacks. It's strongly recommended that you use an SSL-enabled proxy (e.g., Apache or nginx). 

For setting-up, *Self registration = 1*.  It's advisable to set the *Admin user* and disable *Self registration*.  See elog.conf [syntax](https://midas.psi.ch/elog/config.html).
