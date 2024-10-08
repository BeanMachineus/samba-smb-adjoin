# Introduction

My first Repo mixed with both code of fjudith/samba-join-ad, other forks, and my own small fixes.

Samba : the standard Windows interoperability suite of programs for Linux and Unix.
This container aims to run a Samba server registered as a member of a given Active Directory domain.

# Quick start
Run the Samba image.

> Replace <host ip address> by the local ip of the machine executing docker runtime.

```shell
docker run -d
--add-host "docker-smb.localdomain.loc docker-smb":<host ip address> \
--hostname docker-smb \
-e TZ=Etc/UTC
-e DOMAIN_NAME=localdomain.loc \
-e ADMIN_SERVER=dc1.localdomain.loc \
-e WORKGROUP=localdomain \
-e AD_USERNAME=Administrator \
-e AD_PASSWORD=V3rY1ns3cur3P4ssw0rd \
-v /data/fileserver/samba:/etc/samba \
-v /data/fileserver/samba-var:/var/lib/samba/ \
-v /path/to/share:/shares/share_name \
-p 137:137/udp \
-p 138:138/udp \
-p 139:139/tcp \
-p 445:445/tcp \
fjudith/samba-join-ad
```

# Reference

* https://wiki.debian.org/AuthenticatingLinuxWithActiveDirectory
* https://github.com/docker/docker/issues/12084
* http://www.enterprisenetworkingplanet.com/windows/article.php/3849061/Use-Samba-With-Windows-7-Clients.htm
* https://wiki.samba.org/index.php/Setting_up_a_Share_Using_Windows_ACLs
