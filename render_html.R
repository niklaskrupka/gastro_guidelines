# This copies the most recent Bibtex files and renders a HTML file from the R code
directory <- "D:/Research/Literature/Bibtex/"

file_list <- c("ESEGH-1 - Biliary disorders.bib",
               "ESEGH-2 - GI haemorrhage.bib", 
               "ESEGH-3 - IBD and colonic disorders.bib",
               "ESEGH-4 - Liver disorders.bib",
               "ESEGH-5 - Nutrition.bib",
               "ESEGH-6 - Oesophageal disorders.bib",
               "ESEGH-7 - Pancreatic disorders.bib",
               "ESEGH-8 - Small intestinal disorders.bib",
               "ESEGH-9 - Stomach and duodenal disorders.bib",
               "ESEGH-X - Other.bib")

file_list <- paste0(directory, file_list)

file.copy(file_list, "./bibliography/", overwrite = TRUE, recursive = FALSE,
          copy.mode = TRUE, copy.date = TRUE)

rmarkdown::render("gastro_guidelines.R",
                  output_file = "index.html")