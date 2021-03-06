# tableau-server-beta-docker

Dockerfile for Tableau Server on Linux - Single Node. 

Tableau server version is 10.5.2

## Build the enviroment
   
Just run

```
docker build -t vando/tableau-server:env . 
```
    
## Build the image

1. Run the docker image

```
docker run -it --name tableau --privileged -v /sys/fs/cgroup:/sys/fs/cgroup -v /run -p 80 vando/tableau-server:env
```

2. Go for a coffee.

3. Finally, after the message "Tableau server is installed", run

```
docker commit tableau vando/tableau-server:latest
```

## About this fork

I created this fork from [tfoldi/tableau-server-docker](https://github.com/tfoldi/tableau-server-docker)
because it doesn't worked for me. The issue was [in line 23](https://github.com/tfoldi/tableau-server-docker/blob/master/Dockerfile#L23)
and I got this error message

> To run a Tableau Server on Linux, you must use a distro running with systemd. For details on supported distros, see:
> http://onlinehelp.tableau.com/current/serverlinux/en-us/confirm_requirements.htm

## Tableau docs

- [Introducing Tableau Server on Linux](https://onlinehelp.tableau.com/current/server-linux/en-us/release_notes_linux.htm)
- [Whitepaper Tableau for the enterprise](https://www.tableau.com/sites/default/files/whitepapers/whitepaper_tableau-for-the-enterprise_0.pdf)
- [Online Help](http://onlinehelp.tableau.com/v10.5/pro/desktop/en-us/help.htm)

## Tableau download

- [Tableau server (includes release notes)](https://www.tableau.com/support/releases/server)
- [Database drivers](https://www.tableau.com/support/drivers)
