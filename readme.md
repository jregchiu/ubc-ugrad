### Introduction
This _should_ be an accurate image of UBC's ugrad machines, for the purposes of local CPSC assignment compilation & testing. Slightly easier than `scp`/`ssh`-ing all the time!

### Steps to Use:
1. Install Docker. Add yourself to the Docker usergroup so that you won't have to `sudo` every Docker command.
2. Grab this repo.
3. Run `docker build -t <NAME FOR THIS IMAGE> .` from the same directory to build this image, using the instructions in the Dockerfile. **Nb:** obviously this downloads a bunch of packages for the image, so make sure you're not on a metered internet connection!
4. Edit `ugrad`, changing `<NAME FOR THIS IMAGE>` to whatever you chose in Step 3. Copy `ugrad` to `/usr/local/bin`.
5. Make the script executable (`sudo chmod +x /usr/local/bin/ugrad`).
6. Profit! (i.e. `ugrad shell` if you want to launch an interactive bash shell inside the Docker container, at your current working directory. `ugrad make` if you want to compile whatever's in your current working directory, but using the UBC ugrad Docker context, or `ugrad valgrind <executable file>` or `ugrad gdb <executable file>` to use valgrind or gdb). Effectively `ugrad` is just a wrapper to execute whatever commands you pass afterwards as though they're on a UBC ugrad machine.
7. You might have to `docker rm ugrad` after a command to stop and remove the Docker container, if it wasn't removed automatically after you executed a command and get an error.

### Note
Because I don't think you should just copy scripts without understanding them, here's a quick explanation. This creates a shortcut command called `ugrad` or whatever you've named the script, that runs a Docker container, named ugrad, using the ubc-ugrad image that you pulled from this repo. The -v argument links a volume to the container (in this case, the current working directory you execute the script from), and the -w argument sets the current working directory context inside the container to that same directory. Depending what params you pass to `ugrad`, you'll get different results: refer to Step 6 above.

### Disclaimer
Obviously, I don't make any warranties that compiling/testing your assignments on this image is entirely equivalent to compiling/testing on the UBC ugrad machines. **Make sure to compile/run your assignments on the ugad machines before using `handin`!** I'll try to keep this image as up-to-date as possible, including with any libraries that are required to `make` CPSC 213/221 files.
