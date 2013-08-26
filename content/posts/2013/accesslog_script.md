Title: analysis script of accesslog
Date: 2013-08-24 14:00
Category: python
Tags: script, shell, python
Slug: analysis_script_of_accesslog
Author: zxkletters

###The  *script*  is private , it works just on specific format log.  
script:
>awk -F'accessLogger' '{print $2}' accesslog.log | sed 's/ - //g;s/\\//g;s/\"\[/\[/g;s/\]\"/\]/g;s/\"{/{/g;s/}\"/}/g' | python -c 'exec("import sys\nimport simplejson as json\nfor line in sys.stdin.readlines():\n    try:obj=json.loads(line);print \"%s - %s millsec\" % (obj[\"action\"],obj[\"runMillSec\"]);\n    except:    pass")'
