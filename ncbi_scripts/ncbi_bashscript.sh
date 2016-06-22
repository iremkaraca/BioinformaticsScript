#!/bin/bash
#------------------------bsid2info installing------------------------------
wget http://ftp.ncbi.nih.gov/pub/biosystems/biosystems.20160519/bsid2info.gz
gunzip -c bsid2info.gz | sort -g > bsid.txt 

#------------------------biosystems_protein installing----------------------
wget http://ftp.ncbi.nih.gov/pub/biosystems/biosystems.20160519/biosystems_protein.gz
gunzip -c biosystems_protein.gz | awk '{print "a"$2" "$1}' | uniq | sort -g  > gi2bsid.txt

#------------------------prot.accession2taxid installing---------------------
wget http://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/prot.accession2taxid.gz
gunzip -c prot.accession2taxid.gz | awk '{print "a"$4" "$1}' | sort -g > gi2accession.txt

sed -i '1d' gi2accession.txt 

join -a1 -1 1 -2 1  gi2bsid.txt gi2accession.txt | sort -g | uniq | sed 's/a//' > gi_bsid_accession.txt

