# Databricks notebook source exported at Sun, 26 Jun 2016 01:44:37 UTC
# MAGIC %md
# MAGIC 
# MAGIC # [Scalable Data Science](http://www.math.canterbury.ac.nz/~r.sainudiin/courses/ScalableDataScience/)
# MAGIC 
# MAGIC 
# MAGIC ### Course Project by [Akinwande Atanda](https://nz.linkedin.com/in/akinwande-atanda)
# MAGIC 
# MAGIC *supported by* [![](https://raw.githubusercontent.com/raazesh-sainudiin/scalable-data-science/master/images/databricks_logoTM_200px.png)](https://databricks.com/)
# MAGIC and 
# MAGIC [![](https://raw.githubusercontent.com/raazesh-sainudiin/scalable-data-science/master/images/AWS_logoTM_200px.png)](https://www.awseducate.com/microsite/CommunitiesEngageHome)

# COMMAND ----------

# MAGIC %md
# MAGIC The [html source url](https://raw.githubusercontent.com/raazesh-sainudiin/scalable-data-science/master/db/studentProjects/02_AkinwandeAtanda/Tweet_Analytics/044_TA03_01_binary_classification.html) of this databricks notebook and its recorded Uji ![Image of Uji, Dogen's Time-Being](https://raw.githubusercontent.com/raazesh-sainudiin/scalable-data-science/master/images/UjiTimeBeingDogen.png "uji"):
# MAGIC 
# MAGIC [![sds/uji/studentProjects/02_AkinwandeAtanda/Tweet_Analytics/044_TA03_01_binary_classification](http://img.youtube.com/vi/zJirlHAV6YU/0.jpg)](https://www.youtube.com/v/zJirlHAV6YU?rel=0&autoplay=1&modestbranding=1&start=0&end=1611)

# COMMAND ----------

# MAGIC %md
# MAGIC #Tweet Analytics
# MAGIC 
# MAGIC [Presentation contents](https://github.com/aaa121/Spark-Tweet-Streaming-Presentation-May-2016).

# COMMAND ----------

# MAGIC %md
# MAGIC ## Explore the POS_NEG_CATEGORY DATASET
# MAGIC * Download the featured dataset ["pos_neg_category"](https://raw.githubusercontent.com/aaa121/Spark-Tweet-Streaming-Presentation-May-2016/master/pos_neg_category.csv)
# MAGIC * Upload as a Table and change the data type for the "category" column to double

# COMMAND ----------

# MAGIC %sql cache table pos_neg_category

# COMMAND ----------

# MAGIC %sql SELECT category, count(*) as wordCount FROM pos_neg_category group by category order by category

# COMMAND ----------

# MAGIC %sql SELECT if(category == 1, "positive", "negative") as classification, count(*) as wordCount 
# MAGIC FROM pos_neg_category group by category order by category

# COMMAND ----------

# MAGIC %md
# MAGIC ## Featurization

# COMMAND ----------

classWords <-table(sqlContext,"pos_neg_category")
classWords

# COMMAND ----------

select(classWords, classWords$category, contains(classWords$review, "amazing"))

# COMMAND ----------

df <- select(classWords, classWords$category, alias(contains(classWords$review, "bad"), "has_word"))
crosstab(df, "category", "has_word")

# COMMAND ----------

# MAGIC %md
# MAGIC 
# MAGIC # [Scalable Data Science](http://www.math.canterbury.ac.nz/~r.sainudiin/courses/ScalableDataScience/)
# MAGIC 
# MAGIC 
# MAGIC ### Course Project by [Akinwande Atanda](https://nz.linkedin.com/in/akinwande-atanda)
# MAGIC 
# MAGIC *supported by* [![](https://raw.githubusercontent.com/raazesh-sainudiin/scalable-data-science/master/images/databricks_logoTM_200px.png)](https://databricks.com/)
# MAGIC and 
# MAGIC [![](https://raw.githubusercontent.com/raazesh-sainudiin/scalable-data-science/master/images/AWS_logoTM_200px.png)](https://www.awseducate.com/microsite/CommunitiesEngageHome)