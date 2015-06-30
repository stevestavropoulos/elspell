flexy?=~/flexy

pos.data: word.rule.data
	@cat word.rule.data | while read line; do cd ${flexy} && ./run.sh $${line}; done > pos.data

languagetool/languagetool.dict: pos.data
	@cat pos.data | awk -F " " '{OFS="\t"; print $$1, $$2, $$3}' > languagetool/languagetool.dict

languagetool/languagetool_synth.dict: pos.data
	@cat pos.data | awk -F " " '{OFS="\t"; print $$1, $$3, $$2}' > languagetool/languagetool_synth.dict

