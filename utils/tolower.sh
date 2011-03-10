#!/bin/sh

to7="iconv -t iso-8859-7"
from7="iconv -f iso-8859-7"
upper="ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΆΈΌΊΎΉΏ"
lower="αβγδεζηθικλμνξοπρστυφχψωάέόίύήώ"
$to7 | tr `echo $upper $lower | $to7` | $from7 | sed -e 's/σ$/ς/g' -e 's/σ /ς/g'

