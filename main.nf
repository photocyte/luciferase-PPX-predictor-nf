nextflow.enable.dsl=2

// See https://bioinf.uni-greifswald.de/augustus/binaries/tutorial/ppx.html

process msa2prfl_run {
input:
 path msa_fasta
output:
 path "${msa_fasta}.prfl"
shell:
'''
find / -name "default.qij"
msa2prfl.pl --qij=/usr/local/config/profile/default.qij --prefix_from_seqnames --max_entropy=0.75 \
 !{msa_fasta} > !{msa_fasta}.prfl
'''
}

process augustus_ppx_run {
input:
 path genome_fasta 
 path prfl_file
shell:
'''
augustus --species=fly --proteinprofile=!{prfl_file} --UTR=off !{genome_fasta}
'''
}


//This is the main workflow
workflow {
 log.info """\
 L U C I F E R A S E - P P X - N E X T F L O W
 =============================================
 genome        : ${params.genome}
 profile_msa   : ${params.profile_msa}
 
 If you have set the --genome parameter, and
 have access to Miniconda / Singularity,
 this should just work.

 Intermediate results are stored in the
 'work' directory, in the current working dir

 The pipeline will publish results to the
 'results' dir, in the current working dir
 """

 msa2prfl_run(Channel.fromPath(params.profile_msa))

 augustus_ppx_run(Channel.fromPath(params.genome),msa2prfl_run.out)
}
