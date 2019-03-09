# Dockerfile to create an environment that contains the Nix package manager.

FROM alpine

# Enable HTTPS support in wget.
RUN apk add --no-cache --update openssl

# Download Nix and install it into the system.
RUN wget https://nixos.org/releases/nix/nix-2.2.1/nix-2.2.1-x86_64-linux.tar.bz2 \
  && echo "e229e28f250cad684c278c9007b07a24eb4ead239280c237ed2245871eca79e0  nix-2.2.1-x86_64-linux.tar.bz2" | sha256sum -c \
  && tar xjf nix-*-x86_64-linux.tar.bz2 \
  && addgroup -g 30000 -S nixbld \
  && for i in $(seq 1 30); do adduser -S -D -h /var/empty -g "Nix build user $i" -u $((30000 + i)) -G nixbld nixbld$i ; done \
  && mkdir -m 0755 /etc/nix \
  && echo 'sandbox = false' > /etc/nix/nix.conf \
  && mkdir -m 0755 /nix && USER=root sh nix-*-x86_64-linux/install \
  && ln -s /nix/var/nix/profiles/default/etc/profile.d/nix.sh /etc/profile.d/ \
  && rm -r /nix-*-x86_64-linux* \
  && rm -rf /var/cache/apk/* \
  && /nix/var/nix/profiles/default/bin/nix-collect-garbage --delete-old \
  && /nix/var/nix/profiles/default/bin/nix-store --optimise \
  && /nix/var/nix/profiles/default/bin/nix-store --verify --check-contents

ONBUILD ENV \
    ENV=/etc/profile \
    USER=root \
    PATH=/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:/bin:/sbin:/usr/bin:/usr/sbin \
    GIT_SSL_CAINFO=/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt \
    NIX_SSL_CERT_FILE=/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt

ENV \
    ENV=/etc/profile \
    USER=root \
    PATH=/nix/var/nix/profiles/default/bin:/nix/var/nix/profiles/default/sbin:/bin:/sbin:/usr/bin:/usr/sbin \
    GIT_SSL_CAINFO=/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt \
    NIX_SSL_CERT_FILE=/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt \
    NIX_PATH=/nix/var/nix/profiles/per-user/root/channels


RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-build -A pythonFull '<nixpkgs>'

RUN nix-env -iA nixpkgs.bash nixpkgs.zsh nixpkgs.curl
RUN cp $(which bash) $(which zsh) $(which curl) /usr/local/bin/

RUN nix-env -i glibc-locales
ENV LANG   en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN bash -l -c 'echo export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive" >> /etc/zshrc'

RUN adduser -D -g '' -h /home/bauerdic -s /usr/local/bin/zsh -u 6170 -G adm bauerdic

RUN chown -R bauerdic /nix
RUN chown -R bauerdic /root

USER bauerdic
WORKDIR /home/bauerdic

RUN nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs
RUN nix-channel --update
#####RUN nix-collect-garbage -d

RUN nix-shell -p nix-info --run "nix-info -m"

RUN nix-env -i less man coreutils git neovim nox tmux tree

####COPY build.nix /root/
ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"
ENV LANGUAGE="en_US.UTF-8"
# for correct colours is tmux
ENV TERM screen-256color

RUN mkdir ~/.ssh && curl -fsL https://github.com/latbauerdick.keys > ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys
####RUN bash < "$(curl https://nixos.org/nix/install)"

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


RUN echo -e "with import <nixpkgs> {};\npython.withPackages (ps: with ps; [ powerline ])" > /root/build.nix
RUN nix-env -f /root/build.nix -i && python -c 'import powerline; print (powerline.__file__)'



EXPOSE 3222 60000-60010/udp
CMD zsh



