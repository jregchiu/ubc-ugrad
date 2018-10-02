### Introduction
UBC-ugrad is designed to be an accurate Docker image of UBC's ugrad machines, used for local CPSC assignment compilation and testing. You may find it easier than `scp`/`ssh`-ing all the time!

### Steps to Use:
1. Install [Docker](https://www.docker.com) - a computer program that performs OS-level virtualization - and add yourself to the usergroup. Members of the usergroup can avoid using `sudo` for Docker commands.
2. Clone this repository. You can also use the prebuilt Docker image located [here](https://hub.docker.com/r/jregchiu/ubc-ugrad/).
3. Run `docker build -t <NAME FOR THIS IMAGE>` from the repo directory to build the image. This applies the instructions located in the Dockerfile. **Nb:** `docker build -t <NAME FOR THIS IMAGE>` downloads an OS image and a bunch of packages. An unmetered internet connection is recommended.
4. Edit `ugrad` by changing `<NAME FOR THIS IMAGE>` to match the name you chose in Step 3. Copy `ugrad` to `/usr/local/bin`.
5. Make the script executable using the command (`sudo chmod +x /usr/local/bin/ugrad`).
6. Enjoy the benefits of Docker and virtualization! `ugrad` is a wrapper used to execute commands as though you are using the UBC ugrad machine.
   - `ugrad shell` to launch an interactive bash shell inside your current directory, but inside a Docker container.
   - `ugrad make` to compile the contents of the current working directory using the UBC ugrad Docker context.
   - `ugrad valgrind <executable file>` or `ugrad gdb <executable file>` to use valgrind or gdb.
7. You may have to use `docker rm ugrad` after executing a command, to stop and remove the Docker container if an error occurred inside the container.

### Note
I do not recommend users to copy scripts without understanding them, so a brief explanation follows: The shortcut command `ugrad` (you may have chosen a different name) runs a Docker container, named ugrad, using the ubc-ugrad image from this repository. The -v argument links a volume to the container (i.e. the working directory containing the script), and the -w argument matches the working directory context inside the container. Refer to the above Step 6 for the program features.

### Disclaimer
UBC-ugrad is a convenient tool for coding and is not a substitute for the UBC ugrad machines. The results from compiling and testing your assignments on this image may not be identical to the UBC ugrad machines. **Make sure to compile/run your assignments on the ugrad machines before using `handin`!** I will try to keep this image up-to-date, including any libraries that are required to `make` CPSC 213/221/313 files.
