#!/usr/bin/env python3

import logging
from os import system
from telegram.ext import Updater, CommandHandler, MessageHandler, Filters

logging.basicConfig(
        format = "%(asctime)s - %(name)s - %(levelname)s - %(message)s", 
        level = logging.INFO
)
logger = logging.getLogger(__name__)

def start(update, context):
    update.message.reply_text("Hi!")

def help(update, context):
    whatToReply = """List of available commands :

/start
/help
/status
/system_update
/system_reboot
"""
    update.message.reply_text(whatToReply)

def status(update, context):
    system("/var/pi/bot/piinfo.sh")

def system_update(update, context):
    update.message.reply_text("Updating system...")
    if system("sudo /var/pi/bot/sysupd.sh") == 0:
        update.message.reply_text("Updated successfully!")
    else:
        update.message.reply_text("Something went wrong :(")

def system_reboot(update, context):
    update.message.reply_text("Rebooting in...")
    for i in [5, 4, 3, 2, 1]:
        update.message.reply_text(i)
        sleep(1)
    system("sudo /var/pi/bot/sysboot.sh")

def error(update, context):
    logger.warning('Update "%s" caused error "%s"', update, context.error)

def main():
    tokenFile = open("/var/pi/.bot_token", "r")
    token = tokenFile.read().replace('\n', '')
    tokenFile.close()
    updater = Updater(token, use_context=True)
    dp = updater.dispatcher
    dp.add_handler(CommandHandler("start", start))
    dp.add_handler(CommandHandler("help", help))
    dp.add_handler(CommandHandler("status", status))
    dp.add_handler(CommandHandler("system_update", system_update))
    dp.add_handler(CommandHandler("system_reboot", system_reboot))
    dp.add_error_handler(error)
    updater.start_polling()
    updater.idle()

if __name__ == '__main__':
    main()
