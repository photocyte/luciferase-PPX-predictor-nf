seqkit grep -n -r -p "ILUMI_26849-PA|ILUMI_26848-PA|PangLucd_AB479112|PangLL_AB479114|AQULA_002089-PA|ILUMI_06433-PA|AQULA_002435-PA|PatrLuc2|PatrLuc1|BAL46509_1|ILUMI_02534-PA|BAF34360_1|PhirLuc_R|ILUMI_00001-PA|PhirLuc_G|ILUMI_27555-PA|PPYR_00002-PA|PPYR_00001-PA|ILUMI_02533-PA|BAL40875_1|AQULA_005067-PA|PangLucv_AB479113|AOG74999_1" Fallon_et_al_2018_10.7554-eLife.36495.009_MAFFT.fasta > elateroidea_luciferase_clade.fa

##kalign2 version 2.04 ~2006
kalign -a -i elateroidea_luciferase_clade.fa > elateroidea_luciferase_clade.msa.fa
