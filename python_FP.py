
import pandas as pd
from matplotlib import pyplot as plt
data_read = pd.read_csv("C:/Users/konre/OneDrive\Desktop\HAP780_TEMP_PROJECT.csv")
print(data_read)



Data2 = data_read.groupby('survival')[['los']].count()

fig, ax = plt.subplots()

ax.bar(Data2.index, Data2['los'])

labels = ax.get_xticklabels()
plt.setp(labels, rotation = 45, horizontalalignment = 'right')

plt.title('survival vs los')
plt.xlabel('survival')
plt.ylabel('los')





Data1 = (data_read['ethnicity'].value_counts()).iloc[:10]
plt.xlabel('ethnicity')
plt.ylabel('Frequency')
plt.title('ethnicity vs count')
#create bar chart 
Data1.plot(kind='bar')



data=data_read['diagnosis'].value_counts().iloc[:3]
plt.xlabel('diagnosis')
plt.ylabel('count')
plt.title('Top three diagnosis')
#create bar chart 
data.plot(kind='bar')



