# Build: sudo docker build -t <project_name> .
# Run: sudo docker run -v $(pwd):/workspace/project --gpus all -it --rm <project_name>


FROM rocm/pytorch:rocm4.2_ubuntu18.04_py3.6_pytorch_1.8.1
# Deal with pesky Python 3 encoding issue
ENV LANG C.UTF-8
ENV TZ=America/Los_Angeles \
    DEBIAN_FRONTEND=noninteractive
# Basic setup
RUN apt update
RUN apt install -y bash \
                   build-essential \
                   git \
                   curl \
                   ca-certificates \
                   wget \
                   && rm -rf /var/lib/apt/lists
RUN apt-get update && \
    apt-get -y install aria2 git unzip python3-venv netbase && \
    rm -rf /var/lib/apt/lists/*
# Set working directory
WORKDIR /workspace/project
USER root
RUN mkdir /code
WORKDIR /code
RUN apt-get update -y && apt-get upgrade -y
RUN pip install -U pip
COPY requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt
RUN pip install -U jedi==0.17.2
RUN pip install pytorch-lightning torchsummary torchinfo lightning-bolts
RUN pip install hydra-core --upgrade
RUN pip install hydra-optuna-sweeper --upgrade
USER root
RUN mkdir /src
RUN mkdir /dataset
WORKDIR /src
RUN chmod -R a+w .