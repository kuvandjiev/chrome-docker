FROM ubuntu:18.04

RUN apt-get update && apt-get install -y x11vnc xvfb fluxbox wmctrl wget curl vim gnupg2 sudo

RUN useradd puppy \
    --shell /bin/bash  \
    --create-home \
    && usermod -a -G sudo puppy \
    && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && echo 'puppy:secret' | chpasswd

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

RUN apt-get update && apt-get install -y google-chrome-stable \
    gconf-service libasound2 libatk1.0-0 libatk-bridge2.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 \
    libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 \
    libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates \
    libappindicator1 libnss3 lsb-release xdg-utils libfontconfig libfreetype6 xfonts-cyrillic xfonts-scalable xfonts-75dpi \
    xfonts-100dpi fonts-liberation fonts-ipafont-gothic fonts-wqy-zenhei fonts-tlwg-loma-otf ttf-ubuntu-font-family

RUN mkdir -p /tmp/.X11-unix && chmod 1777 /tmp/.X11-unix
RUN chmod -R 777 /root/

WORKDIR /
RUN apt-get update && apt-get install -y git build-essential
RUN git clone https://github.com/wolfcw/libfaketime.git
WORKDIR /libfaketime/src
RUN make install