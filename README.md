## About
The Dockerfile creates a docker image of an [elog](https://midas.psi.ch/elog/) server (3.1.1) built on Ubuntu Linux (16.04).  

The example configuration file creates 3 logbooks.  These can be accessed via http://localhost:8080

## Usage
Download the Dockerfile

```
git clone https://github.com/ad3ller/elog-docker.git
cd ./elog-docker
```

Build the docker image,

```
docker build -t elog .
```

Create a docker volume to store the config file and logbooks,

```
docker volume create --name elog_conf
docker volume create --name logbooks
```

Run the docker image,
```
docker run --name elog-1 --restart always -t -p 8080:8080 -v elog_conf:/etc/elog -v logbooks:/var/lib/elog elog
```
## Notes

In the example, Latex math is rendered using [MathJax](https://www.mathjax.org/).

SMTP (email notification) is not supported.

## Warning

SSL is not supported. Passwords sent over the network are vulnerable to sniffing attacks. It's strongly recommended that you use an SSL-enabled proxy (e.g., Apache or nginx). 

For setting-up, Self Registration = 1.  Recomend disabling and setting the Admin user.  See elog.conf [syntax](https://midas.psi.ch/elog/config.html).
