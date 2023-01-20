#!/bin/sh

./get-secret.sh default aksine-am-com-tls
scp aksine-am-com-tls/tls.crt root@10.0.0.223:/etc/ocserv/server-cert.pem
scp aksine-am-com-tls/tls.key root@10.0.0.223:/etc/ocserv/server-key.pem
scp aksine-am-com-tls/tls.crt root@10.0.0.117:/etc/ssl/ocvpn/fullchain.pem 
scp aksine-am-com-tls/tls.key root@10.0.0.117:/etc/ssl/ocvpn/privkey.pem