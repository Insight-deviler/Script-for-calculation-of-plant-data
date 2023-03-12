import pandas as pd
import numpy as np

# load the dataset into a pandas dataframe
df = pd.read_excel("plant_data.xlsx")

# List of unnecessary headings to exclude
exclude_cols = ['Unnamed: 0', 'sl.no']

# List of column headings to keep
cols_to_keep = [col for col in df.columns if col not in exclude_cols]

# extract the columns for the 6 characters
data = df[cols_to_keep]

# calculate the mean for each character
means = data.mean()

# calculate the standard deviation for each character
stds = data.std()

# calculate the standard error for each character
ses = stds / np.sqrt(len(data))

# calculate the PCV for each character
pcvs = (stds / means) * 100

#for calculating PCV & GCV scale
def assign_value(x):
    if x < 10:
        return 'Low'
    elif x >= 10 and x <= 20:
        return 'Medium'
    else:
        return 'High'

# calculate the GCV for each character
gcvs = ((stds-ses)/means)*100

# create a new dataframe with the results
result_df = pd.DataFrame({
    "Character": cols_to_keep,
    "Mean": round(means,2),
    "Standard Deviation": round(stds,2),
    "Standard Error": round(ses,2),
    "PCV": round(pcvs,2),
    "PCV Scale": [assign_value(x) for x in pcvs],
    "GCV": round(gcvs,2),
    "GCV Scale": [assign_value(x) for x in gcvs]
})

# save the dataframe to an Excel file
result_df.to_excel("plant_data_analysis.xlsx", index=False)
