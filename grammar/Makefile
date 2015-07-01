flexy?=~/flexy

pos.data: word.rule.data
	@cat word.rule.data | while read line; do cd ${flexy} && ./run.sh $${line}; done > pos.data

wl.data: pos.data
	@cat pos.data | awk -F " " '{print $$1}' | sort -u > wl.data

languagetool/languagetool.dict: pos.data
	@cat pos.data | awk -F " " '{OFS="\t"; print $$1, $$3, $$2}' > languagetool/languagetool.dict

