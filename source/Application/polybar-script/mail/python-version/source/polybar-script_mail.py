#!/usr/bin/env python3
"""
File: polybar-script_mail.py
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2019-12-06 14:43:05

Description: 操作邮箱

Attentions：
1. 读取指定邮箱的未读文件数
2. 将未读邮件全部置为已读
"""

import sys
import email
import imaplib

import toml


def get_config(confile):
    """读取配置文件

    :confile: str   -- 配置文件
    :returns: dict  -- 配置信息

    """
    try:
        config = toml.load(confile)
    except Exception:
        config = dict()

    return config


def set_mail(config, tags):
    """操作邮箱

    :config: dict   -- 配置信息
    :tags: list     -- 程序参数
    :returns: str   -- 未读邮件计数/报错信息

    """
    # 防止传入的配置信息为空
    if config:
        server_addr = config['server'].get('addr', 'Server Address')
        port = config['server'].get('port', 993)

        user_name = config['user'].get('name', 'User Name')
        password = config['user'].get('password', 'User Password')

        box = config['mail'].get('mailbox', 'INBOX')
        criteria = config['mail'].get('criteria', 'UnSeen')
    else:
        return '无法获取配置信息'   # Output

    count = 0       # 未读邮件计数
    subject = ''    # 邮件主题

    branch_switch = ['switch', '-s', '-switch', '--switch']
    branch_count = ['count', '-c', '-count', '--count', sys.argv[0]]

    try:
        # 登录指定邮箱帐号
        mail = imaplib.IMAP4_SSL(server_addr, port)
        mail.login(user_name, password)
        try:
            # 检索指定邮箱（收件箱、草稿等）
            mail.select(mailbox=box)
            # mail_index形如：[b'16 17']
            (_, mail_index) = mail.search(None, criteria)

            # 获取未读邮件编号，形如：[b'16', b'17']
            umail = mail_index[0].split()

            # 获取未读邮件计数
            count = len(umail)

            if len(tags) > 2:
                return '程序参数过多'   # Output
            else:
                if tags[-1] in branch_switch:
                    # 分支1：将UNSEEN状态转换为SEEN
                    if count > 0:   # 有未读邮件
                        begin = umail[0].decode()
                        end = umail[-1].decode()
                        interval = '{}:{}'.format(begin, end)

                        mail.store(interval, '+FLAGS', '(\\SEEN)')
                    sys.exit()
                elif tags[-1] in branch_count:
                    # 分支2：获取未读邮件信息
                    if count > 0:
                        # 获取最新未读邮件的标题
                        # # 获取最新未读邮件的原始信息
                        (_, raw_msg) = mail.fetch(
                            umail[-1].decode(), '(RFC822)'
                        )
                        # # 处理最新未读邮件的原始信息
                        msg = email.message_from_string(
                            raw_msg[0][1].decode('utf-8')
                        )
                        if msg:
                            # # 获取最新未读邮件标题
                            subject = str(
                                email.header.make_header(
                                    email.header.decode_header(msg['Subject'])
                                )
                            )
                        else:
                            subject = '需要处理撤回邮件'
                    else:
                        return ''
                else:
                    return '参数错误'   # Output
        except Exception:
            count = 'Search Error'
    except Exception:
        count = 'Login Error'

    # 构建返回值
    mail_count = '[{count}] {subject}'.format(
        count=count, subject=subject
    )

    return mail_count   # Output


if __name__ == "__main__":
    file_name = __file__[:-3]
    confile = '/home/yj/.config/polybar-script/{}.toml'.format(file_name)

    config = get_config(confile)    # 获取配置信息
    tags = sys.argv                 # 获取参数列表

    mail_count = set_mail(config, tags)
    print(mail_count)
