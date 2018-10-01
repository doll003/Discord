import twitter


def tweet(str):
    # 取得したキーとアクセストークンを設定する
    auth = twitter.OAuth(consumer_key="CONSUMER_KEY",
                         consumer_secret="CONSUMER_SECRET",
                         token="TOKEN",
                         token_secret="TOKEN_SECRET")

    t = twitter.Twitter(auth=auth)

    # twitterへメッセージを投稿する
    try:
        t.statuses.update(status=str)
    except twitter.TwitterHTTPError:
        raise Exception('TwitterHTTPError')
    except Exception as err:
        raise Exception(err)
    else:
        return
