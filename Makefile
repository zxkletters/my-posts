PY=python
PELICAN=pelican
PELICANOPTS=

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
PUBLISH_OUTPUT_DIR=$(BASEDIR)/output
GITHUB_OUTPUT_DIR=$(BASEDIR)/gh_pages
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py
GITHUBCONF=$(BASEDIR)/githubconf.py

FTP_HOST=localhost
FTP_USER=anonymous
FTP_TARGET_DIR=/

SSH_HOST=localhost
SSH_PORT=22
SSH_USER=root
SSH_TARGET_DIR=/var/www

S3_BUCKET=my_s3_bucket

DROPBOX_DIR=~/Dropbox/Public/

help:
	@echo 'Makefile for a pelican Web site                                        '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make html                        (re)generate the web site          '
	@echo '   make clean                       remove the generated files         '
	@echo '   make regenerate                  regenerate files upon modification '
	@echo '   make publish                     generate using production settings '
	@echo '   make serve                       serve site at http://localhost:8000'
	@echo '   make devserver                   start/restart develop_server.sh    '
	@echo '   make stopserver                  stop local server                  '
	@echo '   ssh_upload                       upload the web site via SSH        '
	@echo '   rsync_upload                     upload the web site via rsync+ssh  '
	@echo '   dropbox_upload                   upload the web site via Dropbox    '
	@echo '   ftp_upload                       upload the web site via FTP        '
	@echo '   s3_upload                        upload the web site via S3         '
	@echo '   github                           upload the web site via gh-pages   '
	@echo '                                                                       '


#html: clean $(GITHUB_OUTPUT_DIR)/index.html

html: 
	$(PELICAN) $(INPUTDIR) -o $(GITHUB_OUTPUT_DIR) -s $(CONFFILE) $(PELICANOPTS)

github: 
	$(PELICAN) $(INPUTDIR) -o $(GITHUB_OUTPUT_DIR) -s $(GITHUBCONF) $(PELICANOPTS)

#$(GITHUB_OUTPUT_DIR)/%.html:
#	$(PELICAN) $(INPUTDIR) -o $(GITHUB_OUTPUT_DIR) -s $(CONFFILE) $(PELICANOPTS)

clean:
	[ ! -d $(GITHUB_OUTPUT_DIR) ] || find $(GITHUB_OUTPUT_DIR) -mindepth 1 -print

#regenerate: clean
#	$(PELICAN) -r $(INPUTDIR) -o $(GITHUB_OUTPUT_DIR) -s $(CONFFILE) $(PELICANOPTS)

regenerate: 
	$(PELICAN) -r $(INPUTDIR) -o $(GITHUB_OUTPUT_DIR) -s $(CONFFILE) $(PELICANOPTS)

serve:
	cd $(GITHUB_OUTPUT_DIR) && $(PY) -m pelican.server

devserver:
	$(BASEDIR)/develop_server.sh restart

stopserver:
	kill -9 `cat pelican.pid`
	kill -9 `cat srv.pid`
	@echo 'Stopped Pelican and SimpleHTTPServer processes running in background.'

publish:
	$(PELICAN) $(INPUTDIR) -o $(PUBLISH_OUTPUT_DIR) -s $(PUBLISHCONF) $(PELICANOPTS)

ssh_upload: publish
	scp -P $(SSH_PORT) -r $(GITHUB_OUTPUT_DIR)/* $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

rsync_upload: publish
	rsync -e "ssh -p $(SSH_PORT)" -P -rvz --delete $(GITHUB_OUTPUT_DIR)/ $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR) --cvs-exclude

dropbox_upload: publish
	cp -r $(GITHUB_OUTPUT_DIR)/* $(DROPBOX_DIR)

ftp_upload: publish
	lftp ftp://$(FTP_USER)@$(FTP_HOST) -e "mirror -R $(GITHUB_OUTPUT_DIR) $(FTP_TARGET_DIR) ; quit"

s3_upload: publish
	s3cmd sync $(GITHUB_OUTPUT_DIR)/ s3://$(S3_BUCKET) --acl-public --delete-removed

#github: publish
#	ghp-import $(GITHUB_OUTPUT_DIR)
#	git push origin gh-pages

.PHONY: html help clean regenerate serve devserver publish ssh_upload rsync_upload dropbox_upload ftp_upload s3_upload github
