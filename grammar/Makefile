flexy?=~/flexy
flexyrun?=python3 flexy.py

pos.data: word.rule.data
	@cat word.rule.data | while read line; do cd ${flexy} && ${flexyrun} $${line}; done > $@

wl.data: pos.data
	@cat pos.data | awk -F " " '{print $$1}' | sort -u > $@

languagetool/languagetool.dict: pos.data
	@cat pos.data | awk -F " " '{OFS="\t"; print $$1, $$3, $$2}' > $@

languagetool/greek_tags.txt: pos.data
	@cat pos.data | awk -F " " '{print $$2}' | sort -u > $@

