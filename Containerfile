FROM docker.io/opensuse/leap:15.5

RUN zypper mr -da && \
    zypper ar -fcg 'https://mirrors.ustc.edu.cn/opensuse/distribution/leap/$releasever/repo/oss' USTC:OSS && \
     zypper ar -fcg 'https://mirrors.ustc.edu.cn/opensuse/distribution/leap/$releasever/repo/non-oss' USTC:NON-OSS && \
     zypper ar -fcg 'https://mirrors.ustc.edu.cn/opensuse/update/leap/$releasever/oss' USTC:UPDATE-OSS && \
     zypper ar -fcg 'https://mirrors.ustc.edu.cn/opensuse/update/leap/$releasever/non-oss' USTC:UPDATE-NON-OSS && \
     zypper ar -fcg 'https://mirrors.ustc.edu.cn/opensuse/update/leap/$releasever/sle' USTC:UPDATE-SLE && \
     zypper ar -fcg 'https://mirrors.ustc.edu.cn/opensuse/update/leap/$releasever/backports' USTC:UPDATE-BACKPORTS
RUN zypper install -y \
    vim \
    man \
    osc \
    obs-service-format_spec_file \
    obs-service-tar_scm \
    obs-service-recompress \
    obs-service-set_version \
    obs-service-download_files \
    openssh-clients

RUN useradd osc
USER osc
WORKDIR /home/osc

RUN mkdir -p .config/osc
COPY --chown=osc:users oscrc .config/osc/oscrc

RUN echo 'alias iosc="osc -A https://api.suse.de"' > .bashrc

CMD ["/bin/bash"]
