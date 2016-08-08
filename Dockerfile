FROM cviebig/arch-build-ocl

RUN pacman -S --noprogressbar --noconfirm opencl-nvidia nvidia-utils && \
    pacman -Scc --noconfirm
