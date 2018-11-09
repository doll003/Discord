FROM alpine:3.8

RUN apk --update-cache \
        add python3 \
        python3-dev \
        git

RUN pip3 install --upgrade pip
RUN pip3 install discord.py twitter awscli

RUN git clone --depth 1 https://github.com/waneal/discord-tweetbot.git

WORKDIR /discord-tweetbot

CMD ["./exec_discordbot.sh"]

