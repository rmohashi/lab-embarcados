FROM ubuntu:16.04
LABEL maintainer "Rodrigo Masaru Ohashi <ohashi.rm@gmail.com>"

# Build arg: Preferred text editor (default = vim)
ARG EDITORPKG=vim

# Install arm-elf
ADD files/bu-2.15_gcc-3.4.3-c-c++-java_nl-1.12.0_gi-6.1.tar.bz2 /

# Install arm-none-eabi
ADD files/arm-2011.09-69-arm-none-eabi-i686-pc-linux-gnu.tar.bz2 /

# Install additional packages
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        # QEMU build dependencies
        build-essential zlib1g-dev pkg-config libglib2.0-dev binutils-dev \
        libboost-all-dev autoconf libtool libssl-dev libpixman-1-dev git \
        # Multi-arch libraries
        libc6:i386 libncurses5:i386 libstdc++6:i386 libx11-6:i386 \
        # Text editors
        less $EDITORPKG \
        # Python
        python python-pip python-capstone python-dev virtualenv libpython-dev && \
    rm -rf /var/lib/apt/lists/*

# Create non-root "student" user
RUN useradd -mG sudo student && mkdir -p /etc/sudoers.d && \
    echo "%sudo   ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudo_nopasswd && \
    mkdir -p /home/student/src

# Login as "student" user on startup
COPY entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]

# Run commands when starting GDB
ADD files/.gdbinit /home/student/.gdbinit/

# Fix ARM highlight syntax for VIM
ADD files/asm.vim /home/student/.vim/syntax/

# Add QEMU build script
ADD files/build_qemu.py /home/student/build_qemu.py

# Configure user Bash
ADD files/.bashrc /
RUN cat < /.bashrc >> /home/student/.bashrc
