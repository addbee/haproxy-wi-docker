    docker build -t adbe/haproxy-wi .

    docker run -p 8080:80 adbe/haproxy-wi


Just knocked together to give HAProxy-wi a test for a DMZ type VM accessed over a VPN. Missing openldap-devel package suggested by the documentation
