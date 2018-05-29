FROM opensuse/leap:42.3
RUN zypper --non-interactive refresh \
 && zypper --non-interactive install \
    clang \
    gcc \
    gdb \
    glibc-locale \
    libpng-devel \
    make \
    valgrind \
 && zypper --non-interactive clean -a
CMD ["bash"]
