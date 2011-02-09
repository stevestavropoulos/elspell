include settings

RELEASE_DIR=releases
RELEASE_FILE_MYSPELL=releases/el_GR-$(VERSION).zip
RELEASE_FILE_ASPELL=releases/aspell6-el-$(VERSION)-0.tar.bz2

all: $(RELEASE_FILE_MYSPELL)

myspell/el_GR.dic: el.wl
	echo $(shell wc -l el.wl | cut -d " " -f 1) > myspell/el_GR.dic
	cat el.wl >> myspell/el_GR.dic

$(RELEASE_FILE_MYSPELL): myspell/el_GR.dic myspell/* | $(RELEASE_DIR)
	@mkdir -p tmp/
	@iconv -f utf-8 -t iso-8859-7 < myspell/el_GR.aff > tmp/el_GR.aff
	@iconv -f utf-8 -t iso-8859-7 < myspell/el_GR.dic > tmp/el_GR.dic
	@zip -j $@ tmp/el_GR.aff tmp/el_GR.dic myspell/README_el_GR.txt
	@rm -f tmp/*
	@echo "Created version ${VERSION} of el_GR myspell support at $@"

$(RELEASE_FILE_ASPELL): aspell/* | $(RELEASE_DIR)
	@echo 'Aspell release generation not yet implemented...'

$(RELEASE_DIR):
	@mkdir -p $@

