* This is the accompanying repository for Feng's Metagenmoics Report in BIOC3301
* run "/main.sh sample.biom"to check the behaviour, or just check sample_example for pre-compiled output.
* Example plots were included in example/ . You may need libreoffice to view source files
* Details of soil samples included in "sample_mapping.txt"
* Preprocessing before BIOM table was performed on LEGION HPC cluster at UCL. Check "OnLegion" for commands related to
	* splitting library (demultiplexing samples from the pool)
	* Counting sequence number
	* OTU picking with respect to a close reference (default: 13_8 greengenes)
