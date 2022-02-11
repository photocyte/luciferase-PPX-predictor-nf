# luciferase-PPX-predictor-nf
A Nextflow pipeline to try and automate some aspects of luciferase gene ab inito structure prediction

### Status
Working. But not really validated for quality of the predictions.

### To test:

```
nextflow run -profile docker --genome examples/Ilumi1.3-grep13255.fasta --profile_msa examples/elateroidea_luciferase_clade.msa.fa main.nf
```
or
```
nextflow run -profile singularity --genome examples/Ilumi1.3-grep13255.fasta --profile_msa examples/elateroidea_luciferase_clade.msa.fa main.nf
```

(Depending on if you have Docker or Singularity installed)

### Caveats

The example PPX profile blocks for the luciferase homolog MSA, produced with the default parameters, only start within the 3rd exon. So presumably the enhancement of sensitivity is limited for the N-terminal exons.

### Alternatives / future directions

Could try a pipeline for training of Augustus using `busco --long`, along with tblastn/exonerate the luciferase genes & converting them to Augustus `hints` for normal mode ab inito prediction

Could also use Nextflow `splitFasta` to parallelize across the independent FASTA records. An even faster approach might be to limit the prediction to specific slices of FASTA records around tblastn hits: This is already done by things like MAKER for the `prot2genome` prediction I believe.

