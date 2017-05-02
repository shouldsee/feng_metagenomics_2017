mkdir adiv_sample
cp sample.biom adiv_sample
cp 97_otus.tree adiv_sample
cd adiv_sample



#### This script will produce a csv file in "adiv_sample/adiv_5/adiv.csv" , which is then manually processed to yield adiv.ods

biomdir=bioms_5;
mkdir $biomdir
for i in $(seq 0.00001 0.00001 0.0001)
do
filter_otus_from_otu_table.py -i sample.biom -o ${biomdir}/sample_mc${i}.biom --min_count_fraction $i
done
alpha_diversity.py -i ${biomdir} -o adiv_5/ -t 97_otus.tree  -m chao1,PD_whole_tree,observed_otus

cd adiv_5
rm adiv.csv
touch adiv.csv
for i in $(seq 0.00001 0.00001 0.0001)
do
cat alpha_sample_mc${i}.txt >> adiv.csv
done

echo alpha diversity done