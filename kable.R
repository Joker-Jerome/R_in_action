# in jupyter
library(dplyr)
library(kableExtra)
library(knitr)
tissue_df %>%
    arrange(desc(sample_size)) %>%
    kable("html") %>%
    row_spec(which(sample_size < 30), color = "grey") %>%
    kable_styling() %>%
    as.character() %>%
    IRdisplay::display_html()


