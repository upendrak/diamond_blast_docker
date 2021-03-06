# How to run diamond_blast_docker image?

# Clone the github repo that contains the sample data

```
$ https://github.com/upendrak/diamond_blast_docker.git
$ cd diamond_blast_docker
```

## Making the blast database

In order to set up a reference database for DIAMOND, the makedb command needs to be executed with the following command line:

```
$ docker run --rm -v `pwd`:/data upendradevisetty/diamondblast:1.0 makedb --in /data/zebrafish.1.protein.faa -d /data/zebrafish_db
```

This will create a binary DIAMOND database file with the specified name (zebrafish_db.dmnd). 

## Running the alignment

The alignment task may then be initiated using the blastp command like this:

```
$ docker run --rm -v `pwd`:/data upendradevisetty/diamondblast:1.0 blastp --db /data/zebrafish_db -q /data/mouse.1.protein.faa -o /data/matches.m
```

The output file here is specified with the –o option and named matches.m8. By default, it is generated in BLAST tabular format.

**Note:**

  - The program may use quite a lot of memory and also temporary disk space. Should the program fail due to running out of either one, you need to set a lower value for the block size parameter -b (see the manual).
  
  - The default (fast) mode was mainly designed for short reads. For longer sequences, the sensitive modes (options --sensitive or --more-sensitive) are recommended.
  
  - The runtime of the program is not linear in the size of the query file and it is much more efficient for large query files (> 1 million sequences) than for smaller ones.
  
  - Low complexity masking is applied to the query and reference sequences by default. Masked residues appear in the output as X.
  
  - The default e-value cutoff of DIAMOND is 0.001 while that of BLAST is 10, so by default the program will search a lot more stringently than BLAST and not report weak hits.
