#importing NLp based libary
library(udpipe)#for data prep inNLP

#importing dataset
data(brussels_listings,package='udpipe')

#viewing dataset
View(brussels_listings)

#segregating a column
x<-table(brussels_listings$neighbourhood)
View(x)

#sorting
x<-sort(x)
View(x)


#importing text visualisation library
library(textplot)#for complex relation in texts

#word frequancy bar
textplot_bar(x,panel="locations",col.panel="darkgrey",xlab="listings",
             context=0.75,addpct=TRUE,cexpct=0.5)

#importing dataset
data("brussels_reviews_anno",package='udpipe')
View(brussels_reviews_anno)

#segregating dataset
y<-subset(brussels_reviews_anno,xpos %in% "NN" & language %in% "nl" & !is.na(lemma))
View(y)

#docu,emt term frequncy
y<-document_term_frequencies(y,document="doc_id",term="lemma")
View(y)

#document term matrix
dtm <-document_term_matrix(y)
dtm

#removing low frequency word
dtm <-dtm_remove_lowfreq(dtm,maxterms=60)
dtm


#correlation matrix
cor<-dtm_cor(dtm)
View(cor)


#importing libraries
library(glasso)#for graphical lasso:estimation of gaussian graphical

#word correlation plot
#textplot_correlation_glasso(cor,exclude_zero=TRUE)

#word concurrence graph
#segregating data
w<- subset(brussels_reviews_anno,xpos %in% "JJ" & language %in% "fr")
View(w)


#co occuring terms
w<-cooccurrence(w,group="doc_id",term = "lemma")
View(w)

#cooccurence plot
textplot_cooccurrence(w,top_n=25,subtitle="showing only top 25")

#dependency parsing
#creating data
sentence="hey friends welcome to the class . Lets learn about text analytics"

#tokenize and Pos tag for each word inn data
z<-udpipe(sentence,"english")
View(z)

#importing relational data visualization library
library(ggraph)
 #dependency parser plot
textplot_dependencyparser(z)