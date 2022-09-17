FROM debian:bullseye-slim
MAINTAINER sa2kng <knegge@gmail.com>

RUN apt -y update && apt -y upgrade && apt -y --no-install-recommends install python3-pip git procps && rm -rf /var/lib/apt/lists/*
RUN git clone https://gitlab.com/librespacefoundation/satnogs/satnogs-auto-scheduler.git
RUN pip install /satnogs-auto-scheduler --prefer-binary --extra-index-url https://www.piwheels.org/simple && rm -rf /root/.cache/pip/

RUN groupadd -g 995 satnogs && useradd -g satnogs -G dialout,plugdev -m -d /var/lib/satnogs -s /bin/bash -u 999 satnogs
WORKDIR /var/lib/satnogs
USER satnogs

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

