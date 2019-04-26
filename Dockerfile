FROM hashicorp/packer:1.4.0

ARG VERSION=1.4.0
ARG BUILD_DATE
ARG VCS_REF

RUN apk add --update --no-cache qemu qemu-system-x86_64 qemu-img ca-certificates curl tar

LABEL \
    org.label-schema.schema-version="1.0.0-rc.1" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="packer" \
    org.label-schema.vendor="Peter Teslenko <peter.teslenko@gmail.com>" \
    org.label-schema.url="https://github.com/peter-teslenko/packer-qemu" \
    org.label-schema.vcs-url="https://github.com/peter-teslenko/packer-qemu.git" \
    org.label-schema.vcs-ref=${VCS_REF}
