I am working on an incremental AI project called RetailMind AI.

I have completed Day 5, which introduced Deep Learning using an Artificial Neural Network (ANN) for customer churn prediction.

Please use the following as the complete context of my Day 5 work. Do not redesign the project or start from scratch unless I specifically ask you to.

PROJECT:
RetailMind AI

DAY 5:
ANN Customer Churn / Customer Propensity Model

DATASET:
Telco Customer Churn dataset.

The target is Churn:
No = 0
Yes = 1

The purpose of Day 5 was to introduce deep learning and compare an ANN against the classical machine-learning champion from the previous phase.

PREVIOUS WORK:
Before Day 5, I had already built and compared classical machine-learning models.

My model-selection priority was primarily churn-class RECALL, because I want to detect as many actual churn customers as possible.

SVM became the classical ML champion in the earlier phase. Random Forest was another strong candidate. The classical models had already been tuned/evaluated using GridSearchCV, cross-validation, classification metrics, and bias-variance analysis.

DAY 5 OBJECTIVE:
Build a small feed-forward ANN for churn prediction and determine whether using a neural network actually provides an advantage over my classical ML champion.

DAY 5 WORKFLOW COMPLETED:

1. Loaded the existing Telco Customer Churn dataset.

2. Cleaned/prepared the data.

3. Converted the target:
   No -> 0
   Yes -> 1

4. Separated features and target:
   X = input customer features
   y = Churn

5. Created training, validation, and test sets.

6. Created preprocessing for the ANN.

Numerical features:
- Missing-value handling
- StandardScaler normalization

Categorical features:
- Missing-value handling
- OneHotEncoder

The preprocessor was fitted only on training data and then used to transform validation/test data.

7. Converted processed feature arrays to float32 because they are passed to TensorFlow/Keras.

8. Converted y_train, y_val, and y_test to numeric NumPy float32 arrays.

9. Built a feed-forward ANN using TensorFlow/Keras.

The architecture was approximately:

Input
↓
Dense(64, activation="relu")
↓
Dropout(0.3)
↓
Dense(32, activation="relu")
↓
Dropout(0.2)
↓
Dense(1, activation="sigmoid")

The final sigmoid neuron returns the churn probability between 0 and 1.

10. Compiled the ANN using:

optimizer = "adam"
loss = "binary_crossentropy"

Accuracy was monitored during training.

11. Used EarlyStopping.

EarlyStopping monitored:

val_loss

with patience and:

restore_best_weights=True

The purpose was to stop training after validation loss stopped improving and reduce overfitting.

12. Trained the ANN using model.fit() with:

- training data
- validation data
- multiple epochs
- batch size
- EarlyStopping callback

The training history was stored in:

history

I checked training duration using:

len(history.history["loss"])

13. Plotted:

Training Loss
vs
Validation Loss

using:

history.history["loss"]
history.history["val_loss"]

I intentionally did NOT depend on history.history["recall"] because recall was not stored as a Keras training-history metric in my current compile configuration.

14. Generated ANN probabilities on the test data:

y_prob = ann_model.predict(X_test_processed).ravel()

15. Converted probabilities to binary predictions using a 0.5 threshold:

y_pred = (y_prob >= 0.5).astype(int)

Therefore:

probability < 0.5 -> No Churn
probability >= 0.5 -> Churn

16. Evaluated the ANN using Scikit-learn after prediction.

Metrics included:

- Accuracy
- Precision
- Recall
- F1-score
- Classification report
- Confusion matrix

Recall for the positive Churn class remained particularly important.

17. Compared the ANN against the previous SVM champion.

The idea was NOT to assume that ANN/deep learning must be better.

The comparison was based on actual test metrics, especially Recall and F1-score.

The conclusion should honestly state whether ANN depth actually helped on this tabular churn dataset.

18. Saved the ANN using the Keras format:

model/churn_ann.keras

19. Saved the fitted preprocessing object separately using joblib:

model/churn_ann_preprocessor.pkl

This is important because new raw customer records must go through exactly the same preprocessing before being passed to the ANN.

20. The README/documentation includes an honest comparison of classical ML versus ANN.

GENERAL CONCLUSION:
Classical models such as SVM can be very strong on small-to-medium tabular datasets and can be easier/faster to train.

ANNs can learn complex nonlinear relationships but require careful preprocessing, validation, regularization, and overfitting control.

The final model should therefore be selected from measured test performance rather than assuming deep learning is automatically superior.

IMPORTANT CODING PREFERENCES:
- Give me simple, exam-friendly Python.
- Do not overcomplicate the solution.
- Explain confusing lines in easy language.
- Reuse existing code/functions where possible.
- Do not repeatedly rebuild things I already have.
- Give code in manageable sections when I ask for it.
- If I ask for full code, give the complete code together.
- Avoid unnecessary abstractions.
- When comparing churn models, remember that RECALL is my main metric.
- Do not invent model scores. Ask me for the actual score or leave a placeholder if needed.
- Keep documentation human and professional, not AI-sounding.
- Do not add unnecessary images, emojis, or decorative sections to project documentation.

NEXT INCREMENT:
I am now moving to Day 6.

Day 6 is CNN Image Classification for RetailMind AI.

Day 6 requirements are:

1. Prototype a CNN on Fashion-MNIST to validate the CNN architecture.
2. Move to real Fashion Product Images and create an image-loading and augmentation pipeline.
3. Build a CNN following approximately:
   Conv2D -> Pooling -> Conv2D -> Pooling -> Dropout -> Dense -> Softmax
4. Train the CNN to classify product categories.
5. Evaluate the classifier using a confusion matrix and identify which categories are commonly confused.
6. Save the final catalog classifier as the first Computer Vision module.
7. Record the measured accuracy in the README.
8. Transfer learning and YOLO/object detection belong to the NEXT increment, not Day 6.

When helping me next, continue from this context. Do not redo Day 5 unless I specifically ask you to.
