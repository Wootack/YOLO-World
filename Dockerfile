FROM continuumio/miniconda3:latest

ARG USERNAME=vscode
ARG UID=1000
ARG GID=1000

# Create an user with the host username
RUN groupadd --gid $GID $USERNAME && \
    useradd --uid $UID --gid $GID -m $USERNAME && \
    apt-get update && \
    apt-get install -y \
    sudo \
    tmux && \
    # Give sudo permission to the user
    echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install black isort torchmetrics torch_tb_profiler seaborn ujson

ENV PATH="${PATH}:/home/$USERNAME/.local/bin/"

USER $USERNAME
