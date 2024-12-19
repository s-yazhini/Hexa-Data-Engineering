#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Python coding challenge by Yazhini (15-11-2024)
#QUESTION 1: Printing rows of the Data

import pandas as pd

# Load the dataset
df = pd.read_csv("C:/Users/sakthi/Downloads/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Print rows of the data
print(df.head())  # Prints the first 5 rows
print(df.tail())  # Prints the last 5 rows


# In[2]:


# QUESTION 2: Printing the column names of the DataFrame
print("Column Names:")
print(df.columns.tolist())


# In[3]:


# QUESTION 3: Summary of Data Frame

print("Summary of the DataFrame:")
print(df.info())


# In[4]:


# QUESTION 4: Descriptive Statistical Measures of a DataFrame
print("Descriptive Statistics:")
print(df.describe())


# In[6]:


#QUESTION 5: Missing Data Handing
# Check for missing data
print("Missing Data:")
print(df.isnull().sum())

# Drop rows with missing values
df_dropped = df.dropna()



# In[7]:


#QUESTION 6: Sorting DataFrame values
# Sort values by a specific column
sorted_df = df.sort_values(by='Industry_aggregation_NZSIOC', ascending=True)
print(sorted_df) # where 'Industry_aggregation_NZSIOC' is the column name in the data


# In[11]:


#QUESTION 7: Merge Data Frames
# Check data types of both DataFrames
print(df.dtypes)
print(df2.dtypes)

# Ensuring 'Industry_code_NZSIOC' is of the same type in both DataFrames
df['Industry_code_NZSIOC'] = df['Industry_code_NZSIOC'].astype(str)
df2['Industry_code_NZSIOC'] = df2['Industry_code_NZSIOC'].astype(str)

# merging data
merged_df = pd.merge(df, df2, on='Industry_code_NZSIOC', how='left')
print(merged_df)


# In[15]:


#QUES 8: Apply Function

# Ensuring 'Value' column is numeric
df['Value'] = pd.to_numeric(df['Value'], errors='coerce')

# Apply the function to convert the values to thousands
df['Value_in_thousands'] = df['Value'].apply(to_thousands)
print(df[['Value', 'Value_in_thousands']])


# In[16]:


# QUESTION 9: By using the lambda operator

#Ensuring 'Value' column is numeric
df['Value'] = pd.to_numeric(df['Value'], errors='coerce')

# Using lambda to add 100 to each Value
df['Value_plus_100'] = df['Value'].apply(lambda x: x + 100)
print(df[['Value', 'Value_plus_100']])


# In[17]:


#question 10: Visualizing DataFrame

import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

# Ensuring 'Value' column is numeric
df['Value'] = pd.to_numeric(df['Value'], errors='coerce')

# Drop any rows where 'Value' is NaN after conversion
df = df.dropna(subset=['Value'])

# Bar Plot of Variable_name vs Value
plt.figure(figsize=(10, 6))
sns.barplot(data=df, x='Variable_name', y='Value')
plt.title('Value by Variable Name')
plt.xticks(rotation=45)
plt.show()


# In[ ]:




