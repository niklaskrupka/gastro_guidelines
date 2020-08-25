#' ---
#' title: "Guidelines Gastroenterology and Hepatology"
#' author: "Niklas Krupka"
#' output:
#'   html_document
#' ---

#+ stp, echo=FALSE
library(tidyverse)
library(RefManageR)
library(kableExtra)

file_list <- list.files("./bibliography/", full.names = TRUE)
names(file_list) <- str_sub(file_list, start = 22, end = -5)

bib_list <- map(file_list, ReadBib)
bibliography_raw <- map_dfr(bib_list, as.data.frame, .id = "section")

# Index for grouping of sections
papers_per_section <- bibliography_raw %>% 
  group_by(section) %>%
  summarise(n = n())
i <- papers_per_section$n
names(i) <- papers_per_section$section


bibliography <- bibliography_raw %>%
  group_by(section) %>%
  arrange(`mendeley-tags`, .by_group = TRUE) %>% 
  ungroup() %>%
  select(title, journal, year, society = `mendeley-tags`, doi) %>%
  mutate(title = str_sub(title, start = 2, end = -2),
         doi   = paste0("https://doi.org/", doi))
  
kable(bibliography) %>%
  kable_styling(bootstrap_options = c("striped", "condensed"), 
                font_size = 12,
                fixed_thead = TRUE) %>%
  pack_rows(index = i, label_row_css = "background-color: #888; color: #fff;")