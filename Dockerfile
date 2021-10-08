FROM        python:3.10-alpine

RUN         apk add --virtual .build-deps \
                build-base \
                libffi-dev && \
            pip install \
                devpi-server && \
            devpi-init && \
            apk del .build-deps


EXPOSE      3141/tcp
ENTRYPOINT  ["devpi-server"]
CMD         ["--host", "0.0.0.0"]
