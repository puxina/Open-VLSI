# Open VLSI

This is a repository that contains the dockerfile to build a docker image which have the necessary open source tools to VLSI Design.

## 1. Build Requirements

To build any of two modes of the docker image, only the docker is required. To do a clean install of docker on your machine, look on the [Official Docker Installation Guide](https://docs.docker.com/engine/install/). Other basic requirement is `bash` to execute the scripts.

### 1.1 Optional: some Docker configurations

Sometimes the user wants execute docker without have to type `sudo` to have administrator privileges. Also, the user may want to make docker service start on boot. To do these post-installation configurations, refer to the guide provided in [Docker Official Manual](https://docs.docker.com/engine/install/linux-postinstall/).

## 2. Build Instructions

The build process consists on generate a docker image from the
dockerfiles included in this repository. The dockerfiles are divided
in two options: **full image** and **clean image**. 
It is important to clarify that the docker image is based on a base image of Arch
Linux distribution.

The full image is considered here as the default build image, but the
user can choose to build a basic image first and make some
modifications on the container created to finally make the
installation of the VLSI tools.

### 2.1 Docker Image Build Steps

The build process will be described for the two previously mentioned dockerfiles (full and clean).

1. Firstly, clone this repository and enter on the directory:

```
git clone https://github.com/puxina/Open-VLSI.git
cd Open-VLSI
```

2. After that, execute the image build process with the `build_arch-mkIX.sh` script provided, passing only one argument to script (full or clean):

- To build the full image (will take considerable time depending on machine and internet speed):

```
sh ./build_arch-mkIX.sh full
```

- Alternatively, to build the clean image (It will install the base image with some system packages, without installing OpenPDKs.):

```
sh ./build_arch-mkIX.sh clean
```

The two modes of building will copy the VLSI design tools scripts to the docker image.

## 3 Container Creation

After the image build, create a container using the `create_container.sh` script, passing only the desired name of the container (will be passed `vlsi_tests` argument as name example):

```
sh ./create_container.sh vlsi_tests 
```

## 4 Start Container

To execute the container previously created, execute the `start_container.sh` script, passing the name of the desired container (will be passed `vlsi_tests` argument as name example):

```
sh ./start_container.sh vlsi_tests 
```

Then, just use the container.

## 5. Some notes

In case of choosing the clean image build, remember to install the VLSI tools with the `tools_install.sh` script:

```
cd ${MAIN_INSTALL_FILES}
sh ./tools_install.sh
```
