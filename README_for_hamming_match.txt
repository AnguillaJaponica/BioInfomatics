Title:
Script for extracting DNA sequences flanked by MiFish primer-match regions.

Description:
For each of the primer pair, the region with the smallest hamming distance is found in each DNA sequence. If the smallest hamming distance is larger than 3, such sequences are ignored because existence of indels or many mutations is assumed in primer-match regions. For those ignored sequences, manual extraction needs to be conducted afterwards.

Input:
DNA sequences in multi-fasta format. The DNA sequences must NOT contain line feeds (i.e., the file must contain twice lines as many as the number of sequences). The script is case-senstive, thus upper and lower cases must not be mixed in the DNA sequences.

Output:
DNA sequences that are flanked by the primer-match regions, in multi-fasta format.