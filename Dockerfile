FROM mcr.microsoft.com/vscode/devcontainers/python:3.9

# Update args in docker-compose.yaml to set the UID/GID of the "vscode" user.
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN if [ "$USER_GID" != "1000" ] || [ "$USER_UID" != "1000" ]; then groupmod --gid $USER_GID vscode && usermod --uid $USER_UID --gid $USER_GID vscode; fi

RUN pip install dbt==0.20.2 sqlfluff==0.6.6

ENV DBT_PROFILES_DIR=/dbt
