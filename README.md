[![](https://images.microbadger.com/badges/image/pteslenko/packer-qemu.svg)](https://microbadger.com/images/pteslenko/packer-qemu "Get your own image badge on microbadger.com")

# packer-qemu
Docker image for building qemu images with packer

## Check version
    docker run --rm -it --name packer-test pteslenko/packer-qemu --version

## Build qemu based image

    docker run --rm                                                                    \
      -e PACKER_LOG=1                                                                  \
      -e PACKER_LOG_PATH="packer-docker.log"                                           \
      -it                                                                              \
      --privileged                                                                     \
      --cap-add=ALL -v /lib/modules:/lib/modules                                       \
      -v `pwd`:/opt/                                                                   \
      -w /opt/ pteslenko/packer-qemu build -var-file=hardened.json Debian-9-qemu.json
