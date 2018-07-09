### Introduction
UBC-UGrad is designed to be an accurate image of UBC's ugrad machines. The program handles local CPSC assignment compilation and testing, and is easier than repeatedly applying the `scp`/`ssh` command. 

### Steps to Use:
1. Install Docker - a computer program that performs operating-system-level virtualization - and add yourself to the usergroup. Members of the usergroup can avoid using `sudo` for Docker commands.
2. Clone the repository. You can also use the prebuilt Docker image located [here](https://hub.docker.com/r/jregchiu/ubc-ugrad/) as a foundation.
3. Run `docker build -t <NAME FOR THIS IMAGE>` from the directory to build the image. This applies instructions in the Dockerfile. **Nb:** `docker build -t <NAME FOR THIS IMAGE>` downloads a series of packages for the image. An unmetered internet connection is recommended. 
4. Edit `ugrad` by changing `<NAME FOR THIS IMAGE>` to match the name you chose Step 3. Copy `ugrad` to `/usr/local/bin`.
5. Make the script executable using the command (`sudo chmod +x /usr/local/bin/ugrad`).
6. Enjoy the benefits of the program! `ugrad` is a wrapper used execute commands as though you are using the UBC ugrad machine.
   - `ugrad shell` to launch an interactive bash shell inside your current directory's Docker container.
   - `ugrad make` to compile the contents of the current working directory using the UBC ugrad Docker context.
   - `ugrad valgrind <executable file>` or `ugrad gdb <executable file>` to use valgrind or gdb.
7. You might have to use `docker rm ugrad`, after executing a command, to stop and remove the Docker container. The container may not always be removed automatically, which will result in an error. 

### Note
I do not recommend users to copy scripts without understanding code. A brief explanation of the program: 
A shortcut command called `ugrad` (you may have chosen a different name) runs a Docker container, named ugrad, using the ubc-ugrad image from the repository. The -v argument links a volume to the container (i.e. the working directory containing the script), and the -w argument matches the working directory context inside the container. Refer to the above Step 6 for the program features.

### Disclaimer
The UBC-UGrad application is a convenient tool for coding and is not a substitute for the UBC ugrad machines. The results from compiling and testing your assignments on this image may not be identical to the UBC ugrad machines. **Make sure to compile/run your assignments on the ugrad machines before using `handin`!** I will try to keep this image up-to-date, including any libraries that are required to `make` CPSC 213/221 files.
