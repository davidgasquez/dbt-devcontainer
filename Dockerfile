FROM mcr.microsoft.com/vscode/devcontainers/python:3.9

ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then groupmod --gid $USER_GID vscode && usermod --uid $USER_UID --gid $USER_GID vscode; fi

COPY requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --use-deprecated=legacy-resolver --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp

ENV DBT_PROFILES_DIR=/dbt
