# Notebook Observations

## First Notebook

- The first major step after loading the data is observing the **correlation** between numeric features.
- The **object features** are converted to numeric ones using the `LabelEncoder` method from Scikit-learn.
- The dataset is **split into train and test sets**:  
  - `test_size = 20%`
  - `random_state = 4`
- Data is standardized using the `StandardScaler` method to:
  - Improve computation time.
  - Enable faster and more accurate preprocessing, analysis, and reporting.
- A **Linear Regression Model** is built.
- When testing on one sample from the test set:
  - Predicted values are **nearly identical** to actual values.
  - Error is **less than 0.0001**.
- **Model Performance:**
  - **MSE** = `39,068,444`
  - **R²** = `0.697`

---

## Second Notebook

This notebook follows the same steps as the first but with key differences:

- **One-Hot Encoding** is used for the `region` feature:
  - Expands into **4 new features**, each representing whether a region is present.
- **Different graphs** due to feature expansion.
- The **Recursive Feature Elimination with Cross-Validation (RFECV)** technique is applied:
  - Selects **6 out of 9** available features.
- **Model Performance:**
  - **MSE** = `39,379,620`
  - **R²** = `0.694`

---

## Third Notebook

Follows the second notebook with the following adjustments:

- **Histograms** are plotted to check skewness in the target column.
- The **Box-Cox transformation** is applied to the target feature:
  - Helps in obtaining a **symmetric distribution** rather than a skewed one.
- **Principal Component Analysis (PCA)** is used:
  - Reduces features to **7 principal components**.
  - Data can be **reconstructed** from PCA components.
- **Model Performance:**
  - **MSE** = `0.46` *(due to small values after PCA)*
  - **R²** = `0.749`

---

## Fourth Notebook

Follows the previous workflow with these changes:

- **StandardScaler Effects:**
  - Feature **means** are approximately **zero**.
  - Feature **variances** are approximately **one**.
- **K-Fold Cross-Validation (K-Fold CV)** is applied:
  - The dataset is split into **5 folds**.
  - Improves model **generalization**.
  - **Average score** = `0.7668`
- **Model Performance:**
  - **MSE** = `0.468`
  - **R²** = `0.740`

---