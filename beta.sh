## name = raw_all.biom
name=$(basename $1 .biom)
fname=${name}.biom


### This script 


filter_samples_from_otu_table.py -i $fname -o ${name}_mc2510.biom -n 2510
echo summarize_taxa:level 2,3,4,5 >taxa_par
summarize_taxa_through_plots.py -i ${name}_mc2510.biom -o ${name}_taxa_mc2510 -p taxa_par -f
cd ${name}_taxa_mc2510


for biom in *.biom
do
mthd=bray_curtis
ali=$(basename $biom .biom)
dep=2510
ali=$mthd'_'$ali
beta_diversity.py -i $biom -m $mthd -o bdiv_${ali} -t ../97_otus.tree
cd bdiv_${ali}
principal_coordinates.py -i $ali'.txt' -o $ali'_pcoa.txt'
make_emperor.py -i $ali'_pcoa.txt' -o ${ali}_pcoa/ -m ../../mapping_file.txt #--ignore_missing_samples
cd ..
done


biom=../${1}
mthd=unweighted_unifrac
ali=$(basename $biom .biom)
dep=2510
ali=$mthd'_'$ali
beta_diversity.py -i $biom -m $mthd -o bdiv_${ali} -t ../97_otus.tree
cd bdiv_${ali}
principal_coordinates.py -i $ali'.txt' -o $ali'_pcoa.txt'
make_emperor.py -i $ali'_pcoa.txt' -o ${ali}_pcoa/ -m ../../mapping_file.txt #--ignore_missing_samples
cd ..
cd ..


