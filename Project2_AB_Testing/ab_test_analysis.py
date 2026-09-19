import pandas as pd
from scipy import stats
import seaborn as sns
import matplotlib.pyplot as plt

# Load data
df = pd.read_csv('marketing_AB.csv')
print(df.head())
print(df.columns)

# Conversion rate by group
conversion_rates = df.groupby('test group')['converted'].mean()
print(conversion_rates)

# Chi-square test
contingency_table = pd.crosstab(df['test group'], df['converted'])
chi2, p_value, dof, expected = stats.chi2_contingency(contingency_table)
print("Chi-square statistic:", chi2)
print("P-value:", p_value)

if p_value < 0.05:
    print("Significant difference — Reject Null Hypothesis")
else:
    print("No significant difference — Fail to Reject Null Hypothesis")

# Visualization
sns.barplot(x='test group', y='converted', data=df)
plt.title("Conversion Rate by Group")
plt.show()
