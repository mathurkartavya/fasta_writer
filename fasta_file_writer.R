#read the tsv result file from GEO2R

df <- read.table("mhc2_epitopes.tsv" , header = T , sep = "\t")
head(df)

#filter sequences
seqs <- df[,1]
head(seqs)

length(seqs)

#convert into fasta format
count <- 0
data <- vector()

for(i in seqs)
{
  count <- count + 1
  print <- paste(">mhcii_epitoes" , count , sep = "_")
  d <- paste(print , i , sep = "\n")
  data <- c(data , d)
}

#check results
head(data)

#putting data into a file
writeLines(data , "mhcii_epitopes.fasta")
sa