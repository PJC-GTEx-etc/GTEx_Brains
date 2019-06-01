# Write metadata CSV file for samples following quantification.

CONFIG = '/scratch/mjpete11/GTEx/Quantification.config.json'
PHENOTYPES = '/scratch/mjpete11/GTEx/GTEx_Phenotypes.csv'
METADATA = '/scratch/mjpete11/GTEx/Metadata.csv'

import json
import pandas as pd  

# Read in config.
f = open(CONFIG)
data = json.load(f)
f.close()

# Read in phenotype file and choose columns to include.                                                                               
fields = ['SUBJID', 'AGE'] # Read in these columns                                                                                                                                     
df = pd.read_csv(PHENOTYPES, sep=',', header='infer', skiprows=10, usecols=fields) # read_csv() closes file after reading

# Get tissue name from key name from config.
def find_tissue_name(s, term):
    idx = s.find(term)
    string_want = s[:idx]
    return string_want 

# Get sex by finding intersection of sex list and tissue list in config.
def find_sex(female_lst, male_lst, sample):
    if sample in female_lst:
        return 'Female'
    elif sample in male_lst:
        return 'Male'
    else:
        return 'Unidentified sample!'

# Get age by finding intersection of sample list and SUBJID column from GTEx_phenotypes.csv
def find_age(age_lst, sample):
    for i in age_lst:
        if i in sample:
            return str(df.loc[age_lst == i, 'AGE'].iloc[0]) 
        else:
            pass

# Write to CSV file.
out = open(METADATA, 'w')

# Write header.
header = ["Sample", "Tissue", "Sex", "Age"]
out.write(','.join(header)+ '\n')

strings_exclude = ['Salmon_hg38_transcriptome_index_path', 'Males', 'Females'] # keys to ignore

for k in data:
    if not k in strings_exclude:
        for sample in data[k]:
            # get the tissue name
            tissue_name = find_tissue_name(k, '_RNA_Trimmed')
            # get the sex
            sex = find_sex(data['Females'], data['Males'], sample)
            # get the age
            age = find_age(df['SUBJID'], sample)
            # combine into list
            rows = [sample, tissue_name, sex, age]
            out.write(','.join(rows)+'\n')


out.close()
