ARG BASE_IMAGE=alpine
FROM python:$BASE_IMAGE
LABEL maintainer="Ygor Galeno <ygor.tgaleno@gmail.com>"
# Set up workspace and install mkdocs and dependencies.
WORKDIR /usr/src/app

RUN apk add --no-cache \
    git \
    git-fast-import \
    bash

COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt

COPY action.sh /action.sh

RUN chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
