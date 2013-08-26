#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

# basic settings
AUTHOR = u'zxkletters'
SITENAME = u'i care'
DEFAULT_CATEGORY = 'python'
FALLBACK_ON_FS_DATE = True
SITEURL = 'http://notcare.cn'
TIMEZONE = 'Asia/Shanghai'
DEFAULT_LANG = u'zh_CN'

DELETE_OUTPUT_DIRECTORY = False
STATIC_PATHS = [
    'images',
    'extra/robots.txt',
    ]

# Feed generation is usually not desired when developing
#FEED_ALL_ATOM = None
#CATEGORY_FEED_ATOM = None
#TRANSLATION_FEED_ATOM = None

# Blogroll
#LINKS =  (('Pelican', 'http://getpelican.com/'),
#          ('Python.org', 'http://python.org/'),
#          ('Jinja2', 'http://jinja.pocoo.org/'),
#          ('You can modify those links in your config file', '#'),)

# Social widget
#SOCIAL = (('You can add links in your config file', '#'),
#          ('Another social link', '#'),)

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True

DEFAULT_METADATA = (('Author','zxkletters'),)
THEME = "/home/pi/notcare_site/default_themes"

GITHUB_URL = "https://github.com/zxkletters"
