# Tagalog-Reduplication
John Ordono<br />
Dr. Scannell<br />
Unix Tools<br />
Tagalog Reduplication List<br />
<br />
The goal of this project is to make additions for a Tagalog word dictionary.<br />
The linguistic aspect that I will be looking into is reduplication.<br />
<br />
### ABOUT.txt:<br />
-	This file includes background on reduplication in the Tagalog language. In summary, this project's goal is to record words that utilize reduplication by scraping them from Tagalog news websites.
<br />

### REDUPLICATION-SCRAPER.sh:<br />

+		usage: bash REDUPLICATION-SCRAPER.sh <links.txt> <temp.txt> <output.txt>
*	This is the bulk of this project - this is a bash file that takes three .txt files as arguments. The first argument should be a list of websites that you want to pull information from. The second argument is a temp file that holds all of the code pulled from the websites in the first argument. Finally, the third argument is the output file which stores the list of the found words with reduplication. As it parses through the words, if it finds reduplication, it will print out to the terminal whether it was found at the beginning of the word or at the end. This is an attempt at trying to sort out the different types of reduplication.<br />
* This program could easily be reimplemented. This will still take any links and find reduplication in words, however, this does strip away non ASCII characters. Since Tagalog uses the Latin alphabet, the same as English, it works easily. Reduplication, however, is also found in other Malayo-Polynesian languages, so it could also be used for Javanese, Malay, Hawaiian, and many more to find instances of reduplication. It would just have to be adjusted for non-ASCII characters. (Source: http://www.omniglot.com/language/articles/reduplication.php).
<br />

### philstar-links.txt:<br />
-	This is a list of article links from a Filipino news website, Pilipino Star Ngayon. The REDUPLICATION-SCRAPER can use this as its first argument in order to scrape all of the HTML code. This file contains about 50 links.<br />
<br />

### temp.txt:<br />
- This is a temp file that holds the raw data from all of the links provided. The important parts are taken from it, which are the bodies of the articles between the "<p> </p>" flags.<br />
<br />

### output.txt:<br />
- This holds all of the found words from the temp.txt that contain reduplication. This is the output file for philstar-links.txt after running it through the REDUPLICATION-SCRAPER.sh.<br />
<br />

### sort.sh:<br />
+		usage: bash sort.sh <reduplication-word-list.txt>
- This can be used to sort the output.txt file in order to create a frequency list of the words. 
