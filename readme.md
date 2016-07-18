1. Download and install Docker Toolbox: https://www.docker.com/products/docker-toolbox

2. Create a new VM using docker-machine:
docker-machine create --driver virtualbox mihaiair

If you will get an error :
Error with pre-create check: "VirtualBox is configured with multiple host-only adapters with the same IP \"192.168.33.1\". Please remove one."
Fix the issue by manually remove the duplicated host-only networks in virtualbox.
VirtualBox GUI -- (in menu bar: VirtualBox => Preferences => Network => Host-only networks).

3. Run this command to print out export commands which can be run in a subshell.
docker-machine env mihaiair
it'll ask you to run this command to configure your shell
eval "$(docker-machine env mit)"
in case you're using fish shell:
eval (docker-machine env mit)

4. Get VM IP:
docker-machine ip mihaiair
 add it to /etc/hosts: xxx.xxx.xxx.xxx mihaiair.local

5. Now Build the docker images
docker-compose build

6. Up the containers (usually this command runs with -d option, in background, but the first time we setup the environment we need to see the output of the up command)
docker-compose up

7. When no errors are showing in the output of the previous command, it means everything is installed and ready to use; stop the process (Ctrl + c) and run it again with -d this time:
docker-compose up -d

8. You should able to see the site:
http://mihaiair.local:8080/flights


After initial setup:
a. docker-machine start mihaiair
b. docker-machine env mihaiair
c. eval "$(docker-machine env mihaiair)"
d. docker-compose up -d
