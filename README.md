# dockeropenconnect
Docker container for openconnect with ssh

##Run  

docker run -itd -p 9000:22 --name=vpn --privileged --env-file=environment openconnect:latest
