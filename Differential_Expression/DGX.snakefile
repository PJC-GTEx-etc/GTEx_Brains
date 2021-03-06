from os.path import join

# Constants
METADATA = "/scratch/mjpete11/GTEx/Metadata/"
SALMON_DIR = "/scratch/mjpete11/GTEx/Count_Matrices/Salmon/"
HISAT_DIR = "/scratch/mjpete11/GTEx/Tissue_Procesing/Annotated/"
EXACT_DGX =  "/scratch/mjpete11/GTEx/Differential_Expression/Exact_Test/"
FTEST_DGX =  "/scratch/mjpete11/GTEx/Differential_Expression/F_Test/"
RATIO_DGX =  "/scratch/mjpete11/GTEx/Differential_Expression/Ratio_Test/"
SALMON_AGE_GENE = "Salmon/Age_Matched/Gene/"
SALMON_MATCH_GENE = "Salmon/Matched/Gene/"
HISAT_AGE_GENE = "Hisat/Age_Matched/Gene/"
HISAT_MATCH_GENE = "Hisat/Matched/Gene/"

rule all:
    input:
        "/scratch/mjpete11/GTEx/Differential_Expression/Exact_Test/Salmon/Age_Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/Exact_Test/Salmon/Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/F_Test/Salmon/Age_Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/F_Test/Salmon/Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/Ratio_Test/Salmon/Age_Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/Ratio_Test/Salmon/Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/Exact_Test/Hisat/Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/Exact_Test/Hisat/Age_Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/F_Test/Hisat/Age_Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/F_Test/Hisat/Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/Ratio_Test/Hisat/Age_Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/Ratio_Test/Hisat/Matched/Gene/Downreg.json",
        "/scratch/mjpete11/GTEx/Differential_Expression/Ratio_Test/Hisat/Age_Matched/Gene/Downreg.json"

rule AgeMatched_Salmon_Exact:
    input: 
        os.path.join(METADATA, "Age_Matched_Metadata.csv"),
        os.path.join(SALMON_DIR, "Gene_Salmon_CountMatrix.tsv") 
    output:
        os.path.join(EXACT_DGX, SALMON_AGE_GENE, "MD_Plot.pdf"),
        os.path.join(EXACT_DGX, SALMON_AGE_GENE, "Volcano.pdf"),
        os.path.join(EXACT_DGX, SALMON_AGE_GENE, "Upreg.json"),
        os.path.join(EXACT_DGX, SALMON_AGE_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/Exact_Test/Salmon/Exact.R"

rule Matched_Salmon_Exact:
    input: 
        os.path.join(METADATA, "Matched_Metadata.csv"),
        os.path.join(SALMON_DIR, "Gene_Salmon_CountMatrix.tsv") 
    output:
        os.path.join(EXACT_DGX, SALMON_MATCH_GENE, "MD_Plot.pdf"),
        os.path.join(EXACT_DGX, SALMON_MATCH_GENE, "Volcano.pdf"),
        os.path.join(EXACT_DGX, SALMON_MATCH_GENE, "Upreg.json"),
        os.path.join(EXACT_DGX, SALMON_MATCH_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/Exact_Test/Salmon/Exact.R"

rule AgeMatched_Salmon_FTest:
    input: 
        os.path.join(METADATA, "Age_Matched_Metadata.csv"),
        os.path.join(SALMON_DIR, "Gene_Salmon_CountMatrix.tsv") 
    output:
        os.path.join(FTEST_DGX, SALMON_AGE_GENE, "MD_Plot.pdf"),
        os.path.join(FTEST_DGX, SALMON_AGE_GENE, "Volcano.pdf"),
        os.path.join(FTEST_DGX, SALMON_AGE_GENE, "Upreg.json"),
        os.path.join(FTEST_DGX, SALMON_AGE_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/F_Test/Salmon/FTest.R"

rule Matched_Salmon_FTest:
    input: 
        os.path.join(METADATA, "Matched_Metadata.csv"),
        os.path.join(SALMON_DIR, "Gene_Salmon_CountMatrix.tsv") 
    output:
        os.path.join(FTEST_DGX, SALMON_MATCH_GENE, "MD_Plot.pdf"),
        os.path.join(FTEST_DGX, SALMON_MATCH_GENE, "Volcano.pdf"),
        os.path.join(FTEST_DGX, SALMON_MATCH_GENE, "Upreg.json"),
        os.path.join(FTEST_DGX, SALMON_MATCH_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/F_Test/Salmon/FTest.R"

rule AgeMatched_Salmon_Ratio:
    input: 
        os.path.join(METADATA, "Age_Matched_Metadata.csv"),
        os.path.join(SALMON_DIR, "Gene_Salmon_CountMatrix.tsv") 
    output:
        os.path.join(RATIO_DGX, SALMON_AGE_GENE, "MD_Plot.pdf"),
        os.path.join(RATIO_DGX, SALMON_AGE_GENE, "Volcano.pdf"),
        os.path.join(RATIO_DGX, SALMON_AGE_GENE, "Upreg.json"),
        os.path.join(RATIO_DGX, SALMON_AGE_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/Ratio_Test/Salmon/Ratio.R"

rule Matched_Salmon_Ratio:
    input: 
        os.path.join(METADATA, "Matched_Metadata.csv"),
        os.path.join(SALMON_DIR, "Gene_Salmon_CountMatrix.tsv") 
    output:
        os.path.join(RATIO_DGX, SALMON_MATCH_GENE, "MD_Plot.pdf"),
        os.path.join(RATIO_DGX, SALMON_MATCH_GENE, "Volcano.pdf"),
        os.path.join(RATIO_DGX, SALMON_MATCH_GENE, "Upreg.json"),
        os.path.join(RATIO_DGX, SALMON_MATCH_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/Ratio_Test/Salmon/Ratio.R"

rule AgeMatched_Hisat_Exact:
    input: 
        os.path.join(METADATA, "Age_Matched_Metadata.csv"),
        os.path.join(HISAT_DIR, "Amygdala_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Anterior_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Caudate_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellar_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellum_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Frontal_Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hippocampus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hypothalamus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Nucleus_Accumbens_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Putamen_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Spinal_Cord_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Substantia_Nigra_Gene_Matrix.csv")
    output:
        os.path.join(EXACT_DGX, HISAT_AGE_GENE, "MD_Plot.pdf"),
        os.path.join(EXACT_DGX, HISAT_AGE_GENE, "Volcano.pdf"),
        os.path.join(EXACT_DGX, HISAT_AGE_GENE, "Upreg.json"),
        os.path.join(EXACT_DGX, HISAT_AGE_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/Exact_Test/Hisat/Exact.R"

rule Matched_Hisat_Exact:
    input: 
        os.path.join(METADATA, "Matched_Metadata.csv"),
        os.path.join(HISAT_DIR, "Amygdala_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Anterior_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Caudate_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellar_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellum_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Frontal_Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hippocampus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hypothalamus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Nucleus_Accumbens_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Putamen_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Spinal_Cord_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Substantia_Nigra_Gene_Matrix.csv")
    output:
        os.path.join(EXACT_DGX, HISAT_MATCH_GENE, "MD_Plot.pdf"),
        os.path.join(EXACT_DGX, HISAT_MATCH_GENE, "Volcano.pdf"),
        os.path.join(EXACT_DGX, HISAT_MATCH_GENE, "Upreg.json"),
        os.path.join(EXACT_DGX, HISAT_MATCH_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/Exact_Test/Hisat/Exact.R"

rule AgeMatched_Hisat_FTest:
    input: 
        os.path.join(METADATA, "Age_Matched_Metadata.csv"),
        os.path.join(HISAT_DIR, "Amygdala_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Anterior_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Caudate_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellar_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellum_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Frontal_Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hippocampus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hypothalamus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Nucleus_Accumbens_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Putamen_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Spinal_Cord_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Substantia_Nigra_Gene_Matrix.csv")
    output:
        os.path.join(FTEST_DGX, HISAT_AGE_GENE, "MD_Plot.pdf"),
        os.path.join(FTEST_DGX, HISAT_AGE_GENE, "Volcano.pdf"),
        os.path.join(FTEST_DGX, HISAT_AGE_GENE, "Upreg.json"),
        os.path.join(FTEST_DGX, HISAT_AGE_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/F_Test/Hisat/FTest.R"

rule Matched_Hisat_FTest:
    input: 
        os.path.join(METADATA, "Matched_Metadata.csv"),
        os.path.join(HISAT_DIR, "Amygdala_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Anterior_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Caudate_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellar_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellum_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Frontal_Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hippocampus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hypothalamus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Nucleus_Accumbens_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Putamen_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Spinal_Cord_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Substantia_Nigra_Gene_Matrix.csv")
    output:
        os.path.join(FTEST_DGX, HISAT_MATCH_GENE, "MD_Plot.pdf"),
        os.path.join(FTEST_DGX, HISAT_MATCH_GENE, "Volcano.pdf"),
        os.path.join(FTEST_DGX, HISAT_MATCH_GENE, "Upreg.json"),
        os.path.join(FTEST_DGX, HISAT_MATCH_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/F_Test/Hisat/FTest.R"

rule AgeMatched_Hisat_Ratio:
    input: 
        os.path.join(METADATA, "Age_Matched_Metadata.csv"),
        os.path.join(HISAT_DIR, "Amygdala_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Anterior_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Caudate_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellar_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellum_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Frontal_Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hippocampus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hypothalamus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Nucleus_Accumbens_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Putamen_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Spinal_Cord_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Substantia_Nigra_Gene_Matrix.csv")
    output:
        os.path.join(RATIO_DGX, HISAT_AGE_GENE, "MD_Plot.pdf"),
        os.path.join(RATIO_DGX, HISAT_AGE_GENE, "Volcano.pdf"),
        os.path.join(RATIO_DGX, HISAT_AGE_GENE, "Upreg.json"),
        os.path.join(RATIO_DGX, HISAT_AGE_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/Ratio_Test/Hisat/Ratio.R"

rule Matched_Hisat_Ratio:
    input: 
        os.path.join(METADATA, "Matched_Metadata.csv"),
        os.path.join(HISAT_DIR, "Amygdala_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Anterior_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Caudate_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellar_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cerebellum_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Frontal_Cortex_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hippocampus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Hypothalamus_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Nucleus_Accumbens_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Putamen_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Spinal_Cord_Gene_Matrix.csv"),
        os.path.join(HISAT_DIR, "Substantia_Nigra_Gene_Matrix.csv")
    output:
        os.path.join(RATIO_DGX, HISAT_MATCH_GENE, "MD_Plot.pdf"),
        os.path.join(RATIO_DGX, HISAT_MATCH_GENE, "Volcano.pdf"),
        os.path.join(RATIO_DGX, HISAT_MATCH_GENE, "Upreg.json"),
        os.path.join(RATIO_DGX, HISAT_MATCH_GENE, "Downreg.json")
    script:
        "/scratch/mjpete11/GTEx/Differential_Expression/Ratio_Test/Hisat/Ratio.R"
