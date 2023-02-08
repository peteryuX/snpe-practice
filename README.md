# SNPE Practice

## TODOs

- [ ] add Dockerfile
- [ ] upload docker images on GitHub

## Requirements

- Docker
- SNPE SDK ([Qcom's download page](https://developer.qualcomm.com/software/qualcomm-neural-processing-sdk))
- Android NDK ([android-ndk-r17c-linux-x86_64](https://dl.google.com/android/repository/android-ndk-r17c-linux-x86_64.zip))

## Usage

1. Download `snpe-1.53.2.zip` or newer, then uncompress it under this repo.

2. Build a Docker image.

    ```bash
    docker build -t snpe-practice --build-arg USERNAME=docker .
    ```

3. Create a Docker container.

    ```bash
    sudo chmod 755 -R .
    docker run --rm -it -v $(pwd):/home/root/snpe_practice snpe-practice:latest
    ```

4. Run provided script in `./scripts/`. (or other tutorials in SNPE Document.)

## Reference

- SNPE: [Document](https://developer.qualcomm.com/sites/default/files/docs/snpe/index.html)
- Dockerfile: [jungin500/snpe-docker](https://github.com/jungin500/snpe-docker/blob/main/Dockerfile)
