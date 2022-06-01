# afr_amph_app
My second shiny app visualising the shared amphibian species between African countries
It uses data from [The IUCN Red List of Threatened Species](https://www.iucnredlist.org/), accessed in June 2020.
## Painpoints to deal with in the future... 
### Isolate actions so several countries can be deselected at the same time and have a go button
```
actionButton(inputId = "goButton", 
             label = "update diagram")
```
The button is there but I still don't know how to use `data()` to fix the matrix colour. 
### The natural earth package is not working
Maybe there is a way of saving the ggplot object and just update the `geom_text`. The ggplot object has been saved in p and only the `geom_text` is updated. To do this it was necessary to load the `sf` package.
## Deployed
[https://gretacv.shinyapps.io/afr_amph_app/](https://gretacv.shinyapps.io/afr_amph_app/)
## Used tutorials
- by Shiny, [github repo](https://github.com/rstudio-education/shiny.rstudio.com-tutorial)
- by [Jakob37](https://github.com/Jakob37) [tutorial url](https://www.jakobwillforss.com/post/shiny-from-scratch-hands-on-tutorial/)
