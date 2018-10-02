FROM opensuse/leap:15
RUN zypper --non-interactive refresh \
 && zypper --non-interactive install \
    clang \
    gcc \
    gdb \
    glibc-locale \
    ImageMagick \
    libpng-devel \
    make \
    valgrind \
 && zypper --non-interactive clean -a
CMD ["bash"]
