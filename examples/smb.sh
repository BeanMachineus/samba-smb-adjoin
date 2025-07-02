docker stop smb-adjoin
docker rm smb-adjoin
docker run -d \
 --network ExtNet \
 --add-host "smb-adjoin.domaintest.loc smb-adjoin":192.168.71.56 \
 --hostname smb-adjoin \
 --dns 192.168.71.56 \
 --ip 192.168.71.57 \
 --dns-search domaintest.loc \
 -e TZ=America/New_York \
 -e DOMAIN_NAME=domaintest.loc \
 -e ADMIN_SERVER=samba-dc.domaintest.loc \
 -e WORKGROUP=domaintest \
 -e "AD_USERNAME=Administrator" \
 -e "AD_PASSWORD=P@ssw0rd" \
 -v /data/fileserver/samba:/etc/samba \
 -v /data/fileserver/samba-var:/var/lib/samba/ \
 -v /data/fileserver/testshare:/shares/testshare \
 -p 137:137/udp \
 -p 138:138/udp \
 -p 139:139/tcp \
 -p 445:445/tcp \
 --name smb-adjoin \
 --restart unless-stopped \
 --privileged \
 ghcr.io/beanmachineus/samba-smb-adjoin:dev
