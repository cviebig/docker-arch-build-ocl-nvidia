FROM cviebig/arch-build-ocl

RUN pacman -S --noprogressbar --noconfirm opencl-headers cuda git

RUN mkdir -v -p /var/abs/local
RUN cd /var/abs/local && \
    git clone https://aur.archlinux.org/clinfo.git

RUN useradd -ms /bin/bash buildbot
RUN chown -R buildbot:buildbot /var/abs/local
RUN chmod -R 744 /var/abs/local
RUN su -c "cd /var/abs/local/clinfo && makepkg" - buildbot
RUN pacman -U --noconfirm /var/abs/local/clinfo/clinfo-*-x86_64.pkg.tar.xz

