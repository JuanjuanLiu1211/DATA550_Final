all: Final.html

Final.html: Final.Rmd output/tables.rds output/maximum_heart_rate.png
	Rscript -e "rmarkdown::render('Final.Rmd')"

output/heart_clean.rds: data/processed.cleveland.data R/clean_data.R
	Rscript R/clean_data.R

output/tables.rds: output/heart_clean.rds R/make_table.R
	Rscript R/make_table.R

output/maximum_heart_rate.png: output/heart_clean.rds R/make_figure.R
	Rscript R/make_figure.R

.PHONY: all

install:
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: install