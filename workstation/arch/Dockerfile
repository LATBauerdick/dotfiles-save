
# install doctl
FROM archlinux/base

RUN pacman -Sy --noconfirm zsh

RUN mkdir -p /run/sshd
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# RUN sed 's/#Port 22/Port 3222/' -i /etc/ssh/sshd_config

# timezone
RUN ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

# ENV LANG="en_US.UTF-8"
# ENV LC_ALL="en_US.UTF-8"
# ENV LANGUAGE="en_US.UTF-8"

# # for correct colours is tmux
ENV TERM screen-256color

# RUN mkdir ~/.ssh && curl -fsL https://github.com/latbauerdick.keys > ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys

# # zsh plugins
# RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
# RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# RUN git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# RUN pip3 install powerline-status

# # tmux plugins
# RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# RUN git clone https://github.com/tmux-plugins/tmux-open.git ~/.tmux/plugins/tmux-open
# RUN git clone https://github.com/tmux-plugins/tmux-yank.git ~/.tmux/plugins/tmux-yank
# RUN git clone https://github.com/tmux-plugins/tmux-prefix-highlight.git ~/.tmux/plugins/tmux-prefix-highlight

# RUN chsh -s /usr/bin/zsh

EXPOSE 3222 60000-60010/udp

RUN useradd -m -u 6170 -g users -G wheel,storage,power -s /bin/zsh -p "$(openssl passwd -1 arch)" bauerdic
# sudoer
RUN echo "bauerdic ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


RUN pacman -Sy --noconfirm \
    sudo \
    man  \
    openssh \
    vi   \
    curl \
    awk  \
    git  \
    tmux neovim

RUN pacman -Sy --noconfirm \
    stack  \
    make tar \
    pandoc


WORKDIR /home/bauerdic
USER bauerdic
RUN mkdir ~/.ssh && curl -fsL https://github.com/latbauerdick.keys > ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys

# zsh plugins
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


# COPY entrypoint.sh /bin/entrypoint.sh

CMD [zsh]

