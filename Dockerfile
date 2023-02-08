FROM ubuntu:18.04

SHELL [ "/bin/bash", "-c" ]

ARG PROJECT_DIR=/home/root/snpe_practice
ARG SNPE_VERSION=2.5.0.4052
ARG ANDRIOD_NDK_VERSION=r17c

RUN set -ex \
    \
    && echo "Installing development packages" \
    && apt-get -qq update \
    && apt-get install -qqy \
        git \
        g++ \
        build-essential \
        make \
        wget \
    \
    && echo "Install python environment" \
    && apt-get install -qqy \
        python3-distutils \
        python3-venv \
        libpython3.6 \
    && python3 -m venv /venv \
    && /venv/bin/pip install -q --upgrade pip \
    && /venv/bin/pip install -q \
        --upgrade pip \
        pyyaml \
        tensorflow \
        Pillow \
    \
    && echo "Cleanup" \
    && rm -rf /var/lib/apt/lists/*

ENV SNPE_ROOT=$PROJECT_DIR/snpe-$SNPE_VERSION
ENV LD_LIBRARY_PATH=$SNPE_ROOT/lib/x86_64-linux-clang
ENV ANDROID_NDK_ROOT=$SNPE_ROOT/android-ndk-$ANDRIOD_NDK_VERSION-linux-x86_64
ENV TENSORFLOW_DIR=/venv/lib/python3.6/site-packages/tensorflow
ENV PATH=/venv/bin:$PATH

USER $USERNAME

WORKDIR $PROJECT_DIR

CMD ["/bin/bash"]
