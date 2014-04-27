
Average.of.all.variables.for.each.subject.and.activity.combination<-read.table("Average.of.all.variables.for.each.subject.and.activity.combination.txt")

datanames <- colnames(Average.of.all.variables.for.each.subject.and.activity.combination)
outputlines <- paste(1:length(datanames),". ",datanames , sep="")
write.table(outputlines,file="listofnames.md", quote = FALSE, col.names=FALSE, row.names=FALSE)