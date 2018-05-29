##### Introduction
This _should_ be an accurate image of UBC's ugrad machines, for the purposes of local CPSC assignment compilation & testing. Slightly easier than `scp`/`ssh`-ing all the time!

##### Steps to Use:
1. Install Docker.
2. Grab this repo.
3. Run `docker build -t <NAME FOR THIS IMAGE> .` from the same directory to build this image, using the instructions in the Dockerfile.
4. In a bash script (_probably_ in `/usr/local/bin/`, and _probably_ called `ugrad`):
```
#!/bin/bash
PARAM="$@"
if [ $PARAM == "shell" ]
then
sudo docker run --name ugrad -it -v $PWD:/workdir$PWD -w /workdir$PWD <NAME FOR THIS IMAGE>
else
sudo docker run --name ugrad -it -v $PWD:/workdir$PWD -w /workdir$PWD <NAME FOR THIS IMAGE> bash -c "$PARAM && exit" && sudo docker rm ugrad
fi
```
**Nb:** because I don't think you should just copy scripts without understanding them, here's a quick explanation. This creates a shortcut command called `ugrad` or whatever you've named the script, that runs a Docker container, named ugrad, using the Docker image that you built from this Dockerfile. The -v argument links a volume to the container (in this case, the current working directory you execute the script from), and the -w argument sets the current working directory context inside the container to that same directory. Depending what params you pass to `ugrad`, you'll get different results: refer to Step 5.
5. Make the script executable (`sudo chmod +x /usr/local/bin/ugrad`).
6. Profit! (i.e. `ugrad shell` if you want to launch an interactive bash shell inside the Docker container, at your current working directory. `ugrad make` if you want to compile whatever's in your current working directory, but using the UBC ugrad Docker context, or `ugrad valgrind <executable file>` or `ugrad gdb <executable file>` to use valgrind or gdb). Effectively `ugrad` is just a wrapper to execute whatever commands you pass afterwards as though they're on a UBC ugrad machine.
7. You might have to enter `sudo docker rm ugrad` after a command to stop and remove the Docker container, if it wasn't removed automatically after you executed a command and get an error.

##### Disclaimer
Obviously, I don't make any warranties that compiling/testing your assignments on this image is entirely equivalent to compiling/testing on the UBC ugrad machines. **Make sure to compile/run your assignments on the ugad machines before using `handin`!** I'll try to keep this image as up-to-date as possible, including with any libraries that are required to `make` CPSC 213/221 files.
