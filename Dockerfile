FROM cviebig/arch-build-ocl

RUN mkdir -v -p /var/abs/local && \
    cd /var/abs/local && \
    git clone https://github.com/cviebig/arch-aur-nvidia-utils-370 nvidia-utils && \
    chown -R build:build /var/abs/local && \
    chmod -R 744 /var/abs/local && \
    su -c "cd /var/abs/local/nvidia-utils && makepkg" - build && \
    pacman -U --noconfirm /var/abs/local/nvidia-utils/opencl-nvidia-*-x86_64.pkg.tar.xz && \
    pacman -U --noconfirm /var/abs/local/nvidia-utils/nvidia-utils-*-x86_64.pkg.tar.xz && \
    rm -rf /var/abs/local/* && \
    pacman -Scc --noconfirm
