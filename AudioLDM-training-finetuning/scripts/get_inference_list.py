import os
import pandas as pd

# Set your folder path here
folder_path = '/hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/log/testset_data/xcm_v1'

# Get all filenames in the folder
filenames = [f for f in os.listdir(folder_path) if os.path.isfile(os.path.join(folder_path, f))]

# Create a DataFrame
df = pd.DataFrame({'filename': filenames})

# Extract label (text before '_split')
df['label'] = df['filename'].str.extract(r'^(.*?)_split')

# Create the final list in the required format
with open('/hpcwork/lect0151/stablelofieditor/AudioLDM-training-finetuning/tests/captionlist/inference_base.lst', 'w') as f:
    for _, row in df.iterrows():
        f.write(f"{row.filename}|{row.label}\n")
