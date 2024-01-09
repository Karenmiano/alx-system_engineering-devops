sudo tee -a 'new' <<ADDTHIS
frontend tomyservers
        mode http
        bind :80
        default_backend karenbuilds

backend karenbuilds
        mode http
        balance roundrobin
        server web-01 54.144.142.198:80 check
        server web-02 34.207.222.12:80 check
ADDTHIS