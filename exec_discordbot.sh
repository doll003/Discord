#!/usr/bin/env bash

set -e

PARAMETER_STORE_PREFIX="DISCORD_TWEETBOT"

export DISCORD_SECRET_KEY=$(aws ssm get-parameters --name "/${PARAMETER_STORE_PREFIX}/DISCORD_SECRET_KEY" --with-decryption --query "Parameters[0].Value" --region ap-northeast-1 --output text)
export TWITTER_CONSUMER_KEY=$(aws ssm get-parameters --name "/${PARAMETER_STORE_PREFIX}/TWITTER_CONSUMER_KEY" --with-decryption --query "Parameters[0].Value" --region ap-northeast-1 --output text)
export TWITTER_CONSUMER_SECRET=$(aws ssm get-parameters --name "/${PARAMETER_STORE_PREFIX}/TWITTER_CONSUMER_SECRET" --with-decryption --query "Parameters[0].Value" --region ap-northeast-1 --output text)
export TWITTER_TOKEN=$(aws ssm get-parameters --name "/${PARAMETER_STORE_PREFIX}/TWITTER_TOKEN" --with-decryption --query "Parameters[0].Value" --region ap-northeast-1 --output text)
export TWITTER_TOKEN_SECRET=$(aws ssm get-parameters --name "/${PARAMETER_STORE_PREFIX}/TWITTER_TOKEN_SECRET" --with-decryption --query "Parameters[0].Value" --region ap-northeast-1 --output text)

exec "python discordbot.py"