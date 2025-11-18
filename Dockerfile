from archlinux:base
MAINTAINER Éric NICOLAS (ccjmne) <ccjmne@gmail.com>

LABEL "com.github.actions.name"="Zola Deploy to Pages (with zola/next)"
LABEL "com.github.actions.description"="Build and deploy a Zola site to GitHub Pages, using the latest features from zola/next"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="green"

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /build
RUN pacman -Sy --noconfirm git vim rust cargo
RUN git clone --depth 1 --branch next https://github.com/getzola/zola .
RUN cargo build --release
RUN cp ./target/release/zola /usr/local/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
