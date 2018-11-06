from discord.ext import commands
import twitter_post
import os

DISCORD_SECRET_KEY = os.environ['DISCORD_SECRET_KEY']

description = 'You can tweet via me!'
bot = commands.Bot(command_prefix='$', description=description)


@bot.event
async def on_ready():
    print('Logged in as')
    print(bot.user.name)
    print(bot.user.id)
    print('------')


@bot.command(pass_context=True)
async def t(ctx, *args):
    if args is None:
        await bot.say("ツイートしたい文章が含まれていません！ざんねん！")
    message = ' '.join(args)
    try:
        twitter_post.tweet(message)
    except Exception as err:
        await bot.say("ツイートに失敗しました！くやしい！\n\n詳細: {0}".format(err))
        return
    else:
        await bot.say("{0} ツイートに成功しました！やったね！".format(ctx.message.author.mention))

bot.run(DISCORD_SECRET_KEY)