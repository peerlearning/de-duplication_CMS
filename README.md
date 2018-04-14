# De-Duplication

- We are trying to identify and near duplicate Questions existing in the CMS
- This will help improve student experience by eliminating almost similar or exact Qs repeatedly
- To do this, we are using a similarity measure (cosing similarity) to identify potential pairs of duplicate Qs
- In future, we can use a machine learning model to idenitfy duplicates using labelled training data
- The analysis is performed using NLP packages on R (text2vec and tm) and the R Markdown script is added. The text repository fetcehd from CMS is also added here.
- The identified duplicate Qs have been added, and verified, on this Googlesheet : https://docs.google.com/spreadsheets/d/1j5gmb8l2U2974yS0WF2wY6w7ZTU-Iz7E0lOXQqbSe6c/edit?usp=sharing

