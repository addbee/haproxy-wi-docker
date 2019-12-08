HAProxy-WI Docker Image (NGINX, FCGI and uWSGI)
======

https://github.com/Aidaho12/haproxy-wi deployed to a docker container using nginx instead of apache..
Image based from https://github.com/tiangolo/uwsgi-nginx-docker and overrides their provided nginx.conf with this included version.

Download:

    git clone https://github.com/addbee/haproxy-wi-docker.git && cd haproxy-wi-docker
    
Build the image:

    docker build -t addbee/haproxy-wi .

Run and bind to local port 8080

    docker run -p 8080:80 addbee/haproxy-wi

Just knocked together to give HAProxy user interface HAProxy-WI a trial for configuring a DMZ/ingress VM (wi accessed internally via VPN.)

Known Differences/Issues:
 - Missing openldap-devel package suggested by the documentation
   - Happy to include if there is a suggested package in the repo
 - Some processes running as root that could be better
 - Not using SSL/letsencrypt
   - If you find that's necessary, use haproxy, nginx or traefik separately. For my own purposes this was briefly accessible internally over a VPN. Feel free to fork or submit a pull request with additional config.
 - Error messages when starting the container after init 
   - not investigated but seems to run fine (dir already exists)



May revisit in future but I don't plan to use this anymore (but a public docker image seems to have been requested by others, so sharing as a base for future development.)

