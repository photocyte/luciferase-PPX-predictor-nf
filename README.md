# luciferase-PPX-predictor-nf
A Nextflow pipeline to try and automate some aspects of luciferase gene ab inito structure prediction

### Status
Despite a good MSA & seemingly good profile, augustus errors out.
```
Command error:
  
  augustus: ERROR
  augustInvalid block no. in SubstateModel::blockNoOfB
```
Raised an issue with the Augustus developers: https://github.com/Gaius-Augustus/Augustus/issues/333

### To test:

```
nextflow run -profile docker --genome examples/Ilumi1.3-grep13255.fasta --profile_msa examples/elateroidea_luciferase_clade.msa.fa main.nf
```
or
```
nextflow run -profile singularity --genome examples/Ilumi1.3-grep13255.fasta --profile_msa examples/elateroidea_luciferase_clade.msa.fa main.nf
```

(Depending on if you have Docker or Singularity installed)

### Alternatives

If PPX mode doesn't work, could try a pipeline for training of Augustus using `busco --long`, along with tblastn/exonerate the luciferase genes & converting them to Augustus `hints` for normal mode ab inito prediction
