#Hackathon_2021_06

library("tidyr")
library("dplyr")
library("icesTAF")
library("ggplot2")

#server_site = "/Users/chunhsuanlojason/Desktop/"
server_site = "/home/chunhsuanlo2020/workspace/Hackathons/"

input_dir = paste(server_site, "Hackathon_Clinical_Reporting_of_MultiOmics_Data/", "download_data/", sep="") 

output_dir = paste(server_site, "Hackathon_Clinical_Reporting_of_MultiOmics_Data/", "R_scripts/", "output/", sep="")
mkdir(output_dir)

working_dir = paste(server_site, "Hackathon_Clinical_Reporting_of_MultiOmics_Data/", "R_scripts/", "output/", sep="") 
setwd(working_dir)

PRS.csv <- read.table(paste(input_dir, "PRS.csv", sep="/"), header = TRUE)                         
PRS_feature_importance.csv <- read.table(paste(input_dir, "PRS_feature_importance.csv", sep="/"), header = TRUE)
disease_probability.csv <- read.table(paste(input_dir, "disease_probability.csv", sep="/"), header = TRUE)             

# "PRS.csv_transformaed" as input; "PRS_feature_importance.csv_transformaed" & "disease_probability.csv_transformaed" as output; for the trained predicting model.

# each row is one sample/individual (totally 100,000 individuals), and each column is a PRS score (totally 1400 phenotypes/features) calculated using one GWAS’ stats (SNPs only in Chr1)! (The first two columns are Sample/individual IDs)
# those 1400 features are supposed to leading to a single complex disease
PRS.csv_transformed <- data.frame(do.call('rbind', strsplit(as.character(PRS.csv[,2]), ",", fixed=TRUE)))[,c(-1, -2)]                        #100,000 rows, 1400 columns
disease_probability.csv_transformed <- data.frame(do.call('rbind', strsplit(as.character(disease_probability.csv[,1]),',',fixed=TRUE)))[,2]  #100,000 rows, 1    columns  (100,000sampled individuals)
PRS_feature_importance.csv_transformed <- strsplit(as.character(PRS_feature_importance.csv[1,]),',',fixed=TRUE)[[1]]                         #1400    rows, 1    columns  (1400 features)
write.table(PRS.csv_transformed, file = paste(output_dir, "PRS.csv_transformed.txt", sep=""), sep = '\t', row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(disease_probability.csv_transformed, file = paste(output_dir, "disease_probability.csv_transformed.txt", sep=""), sep = '\t', row.names = FALSE, col.names = FALSE, quote = FALSE)
write.table(PRS_feature_importance.csv_transformed, file = paste(output_dir, "PRS_feature_importance.csv_transformed.txt", sep=""), sep = '\t', row.names = FALSE, col.names = FALSE, quote = FALSE)





##For PRS_feature_importance
visualization_temp <- as.data.frame(as.numeric(PRS_feature_importance.csv_transformed))
visualization_temp <- mutate(visualization_temp, observation = 1:nrow(visualization_temp))
colnames(visualization_temp) <- c("value","ID")
ggplot(visualization_temp , aes(x=ID, y= value)) + 
	coord_cartesian(xlim=c(0,1400)) + scale_x_continuous(breaks=seq(0, 1400, 100)) +
	geom_bar(stat='identity') + 
	labs(title="PRS_feature_importance as weighting-parameters of PRS_value for the predictive model", x = "feature_ID", y = "PRS_feature_importance") +
	theme(aspect.ratio=0.25, title = element_text(size=7, face='bold')) +
	ggsave(paste(output_dir, "PRS_feature_importance.pdf", sep=""), device='pdf',limitsize = FALSE)

##For disease_probability
visualization_temp <- as.data.frame(as.numeric(disease_probability.csv_transformed))
visualization_temp <- mutate(visualization_temp, observation = 1:nrow(visualization_temp))
colnames(visualization_temp) <- c("value","ID")
ggplot(visualization_temp , aes(x=ID, y= value)) +
        coord_cartesian(xlim=c(0,100000)) + scale_x_continuous(breaks=seq(0, 100000, 10000)) +
        geom_bar(stat='identity') +
        labs(title="Disease_probability being estimated by the predictive model", x = "individuals_ID", y = "Disease_probability") +
        theme(aspect.ratio=0.25, title = element_text(size=7, face='bold')) +
        ggsave(paste(output_dir, "Disease_probability.pdf", sep=""), device='pdf',limitsize = FALSE)

##For each individual 
for(count1 in c(1:10)){
        assign(paste("person_",count1,"_PRS.csv_transformed", sep=""), PRS.csv_transformed[count1,])
        assign(paste("person_",count1,"_disease_probability.csv_transformed", sep=""), disease_probability.csv_transformed[count1])
	summary(get(paste("person_",count1,"_PRS.csv_transformed", sep="")))
}

#PRS.csv_transformed
for(count1 in c(1:10)){
	visualization_temp <- as.data.frame(t(get(paste("person_",count1,"_PRS.csv_transformed", sep=""))))
	visualization_temp <- mutate(visualization_temp, observation = 1:nrow(visualization_temp))
	colnames(visualization_temp) <- c("value","ID")
	ggplot(visualization_temp , aes(x=ID, y= value)) + 
        	coord_cartesian(xlim=c(0,1400)) + scale_x_continuous(breaks=seq(0, 1400, 100)) +
        	geom_point() +
                labs(title=paste("PRS_value of each feature for the Person_", count1, sep=""), x = "feature_ID", y = "PRS_value") +
		theme(aspect.ratio=0.2, title = element_text(size=10, face='bold')) +
        	ggsave(paste(output_dir, "Person_",count1,"_PRS.pdf", sep=""), device='pdf', limitsize = FALSE)
}





