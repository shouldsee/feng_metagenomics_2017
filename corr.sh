#### This script take an ".biom" (HDF-5 formatted OTU table) as input
##### This script produce a "hits" directory containing taxonomic units associated with PC1 of  ..._spearman_otu_gradient.txt 
name=$(basename $1 .biom)
fname=${name}.biom
cd ${name}_taxa_mc2510
mkdir hits
pwd
map=../mapping_file_${name}_PC1.txt;
# map=../mapping_file_PC1.txt
for biom in *.biom
do
ali=$(basename $biom '.biom')
mthd=bray_curtis
# tlevel=$(echo $ali| cut -d'_' -f -1)
tlevel=${ali##*_}

echo $tlevel
field=pca1_${tlevel}
observation_metadata_correlation.py -i $biom -m $map -c $field -s spearman -o hits/${ali}_${field}_spearman_otu_gradient.txt
### The bootstrapping process is a lot slower than fisher transform
#### observation_metadata_correlation.py -i $biom -m $map -c $field -s spearman -o hits/bootstrapped_${ali}_${field}_spearman_otu_gradient.txt --pval_assignment_method bootstrapped

done

biom=../${1}
tlevel=unweighted_unifrac

ali=$(basename $biom '.biom')
mthd=bray_curtis
# tlevel= 
# echo $tlevel
field=pca1_unweighted_unifrac
map=../mapping_file_${name}_PC1.txt;
observation_metadata_correlation.py -i $biom -m $map -c $field -s spearman -o hits/${ali}_${field}_spearman_otu_gradient.txt
##bootstrap
#### observation_metadata_correlation.py -i $biom -m $map -c $field -s spearman -o hits/bootstrapped_${ali}_${field}_spearman_otu_gradient.txt --pval_assignment_method bootstrapped
