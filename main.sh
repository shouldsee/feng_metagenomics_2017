#### 
# input file: detail
# sample.biom: OTU table for this study
# raw_all.biom: OTU table with external data combined
# 1=sample.biom

### This script will perform a workflow on a selected BIOM file

name=$(basename $1 .biom)
biom=$1
mkdir $name
cd $name
cp ../${biom} .
cp ../97_otus.tree .
cp ../mapping_file.txt .


../alpha.sh $biom 
echo "\n [Please manually edit adiv_${name}/adiv.csv to produce plots] \n"
../beta.sh $biom
mpf=mapping_file_${name}_PC1.txt
cp mapping_file.txt $mpf
printf "Please paste your PC1 coordinates into $mpf from 'bdiv_' folders in ${name}_taxa_mc2510, \n Remember to validate save your $mpf in .tsv format!!!"
read -n1 -r -p " Then press any key to start correlation analysis" key
../corr.sh $biom



# biom summarize-table -i $1 >sample_summary.txt
# filter_samples_from_otu_table.py -i $1 -o ${name}_mc2510.biom -n 2510
# filter_samples_from_otu_table.py -i sample.biom -o sample_mc10000.biom -n 10000
# echo "summarize_taxa:level 2,3,4,5" > taxa_par
# summarize_taxa_through_plots.py -i ${name}_mc2510.biom -o taxa_${name}_mc2510 -p taxa_par -f

# biom=${name}_mc2510.biom;
# ./alpha.sh combined.biom
# ./alpha.sh sample.biom

# filter_samples_from_otu_table.py -i sample.biom -o sample_mc10000.biom -n 10000


# filter_samples_from_otu_table.py -i raw_all.biom -o raw_all_mc2510.biom -n 2510
# summarize_taxa.py -i raw_all_mc2510.biom -o taxa_all_mc2510 --level 2,3,4,5
# cd taxa_all_mc2510
# for ali in *.biom
# do
# mthd=bray_curtis
# ali=$(basename $ali .biom)
# dep=2510
# name=$mthd'_'$ali
# beta_diversity.py -i ${ali}.biom -m $mthd -o beta_div_${ali} -t ../97_otus.tree
# cd beta_div_${ali}
# principal_coordinates.py -i $name'.txt' -o $name'_pcoa.txt'
# make_emperor.py -i $name'_pcoa.txt' -o ${name}_pcoa/ -m ../../mapping_file.txt #--ignore_missing_samples
# cd ..
# tlevel=$(echo $ali| cut -d'_' -f 4)
# field=pca1_${tlevel}
# map=../mapping_file_ordered.txt;
# observation_metadata_correlation.py -i ${ali}.biom -m $map -c $field -s spearman -o ${ali}_${tlevel}_spearman_otu_gradient.txt
# ####observation_metadata_correlation.py -i ${ali}.biom -m $map -c $field -s spearman -o bootstrapped_${ali}_${tlevel}_spearman_otu_gradient.txt --pval_assignment_method bootstrapped
# done

# map=../mapping_file_ordered.txt;
# biom=../raw_all_mc2510.biom
# ali=raw_all
# field=pca1_unweighted_unifrac
# tlevel=unweight_unifrac
# observation_metadata_correlation.py -i $biom -m $map -c $field -s spearman -o ${ali}_${tlevel}_spearman_otu_gradient.txt


# map=../mapping_file_ordered.txt;
# biom=../raw_all_mc2510.biom
# ali=raw_all
# field=random
# tlevel=random
# observation_metadata_correlation.py -i $biom -m $map -c $field -s spearman -o ${ali}_${tlevel}_spearman_otu_gradient.txt


# map=../mapping_file_ordered.txt;
# biom=../raw_all_mc2510.biom
# ali=raw_all
# field=constant
# tlevel=constant
# observation_metadata_correlation.py -i $biom -m $map -c $field -s spearman -o ${ali}_${tlevel}_spearman_otu_gradient.txt


# # cd ..





# biom0=sample.biom
# # summarize_taxa.py -i $biom0 -o taxa_sample --level 2,3,4,5
# summarize_taxa_through_plots.py -i $biom0 -o taxa_sample -p taxa_par -f

# cd taxa_sample

# # for ali in *.biom
# # do
# # mthd=bray_curtis
# # ali=$(basename $ali .biom)
# # dep=2510
# # name=$mthd'_'$ali

# # # beta_diversity.py -i ${ali}.biom -m $mthd -o beta_div_${ali} -t ../97_otus.tree
# # # cd beta_div_${ali}
# # # principal_coordinates.py -i $name'.txt' -o $name'_pcoa.txt'
# # # make_emperor.py -i $name'_pcoa.txt' -o ${name}_pcoa/ -m ../../mapping_file.txt #--ignore_missing_samples
# # # cd ..

# # tlevel=$(echo $ali| cut -d'_' -f 2)
# # field=pca1_${tlevel}
# # map=../mapping_file_ordered.txt;
# # observation_metadata_correlation.py -i ${ali}.biom -m $map -c $field -s spearman -o ${ali}_${field}_spearman_otu_gradient.txt
# # observation_metadata_correlation.py -i ${ali}.biom -m $map -c $field -s spearman -o bootstrapped_${ali}_${field}_spearman_otu_gradient.txt --pval_assignment_method bootstrapped
 
# # tlevel=$(echo $ali| cut -d'_' -f 2)
# # field=constant
# # map=../mapping_file_ordered.txt;
# # observation_metadata_correlation.py -i ${ali}.biom -m $map -c $field -s spearman -o ${ali}_${field}_spearman_otu_gradient.txt
# # ### boostrap against constant to show insignificancy
# # ####observation_metadata_correlation.py -i ${ali}.biom -m $map -c $field -s spearman -o bootstrapped_${ali}_${field}_spearman_otu_gradient.txt --pval_assignment_method bootstrapped

# # done

# map=../mapping_file_ordered.txt;
# # biom=../raw_all_mc2510.biom
# # ali=raw_all
# field=pca1_unweighted_unifrac
# tlevel=unweight_unifrac
# observation_metadata_correlation.py -i ../${biom0} -m $map -c $field -s spearman -o $(basename $biom0 .biom)_${field}_spearman_otu_gradient.txt
# observation_metadata_correlation.py -i ../${biom0} -m $map -c $field -s spearman -o ${biom0}_${field}_spearman_otu_gradient.txt --pval_assignment_method bootstrapped

# # map=../mapping_file_ordered.txt;
# # # biom=../raw_all_mc2510.biom
# # # ali=raw_all
# # field=constant
# # tlevel=constant
# # # observation_metadata_correlation.py -i ../${biom0} -m $map -c $field -s spearman -o $(basename $biom0 .biom)_spearman_otu_gradient.txt
# # observation_metadata_correlation.py -i ../${biom0} -m $map -c $field -s spearman -o ${biom0}_${field}_spearman_otu_gradient.txt --pval_assignment_method bootstrapped



# # cd ..



