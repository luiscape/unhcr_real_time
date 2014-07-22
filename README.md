UNHCR 'Real-time' to HDX Format
===============================

Converting the data scraped from UNHCR into HDX' "format".

![Plot of all indicators]('plot.png')


Issues
------

The `region` column contains contains data about a UNHCR operation, not necessarily about a country. For example, 'SYR' isn't the country Syria, but rather data about the Syria crisis. We haven't implemented the Entity 'crisis' in our database yet.

Also, 'Horn' was changed to 'SOM' (Somalia). That is wrong analytically, but works as a matter of experimenting with the data.