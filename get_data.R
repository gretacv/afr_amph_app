#get data

load("data/Working_mat.Rdata")
load("data/continents_iso2.Rdata")
load("data/p.Rdata")

#slider_min = min(Working_mat)
#slider_max = max(Working_mat)

country_names = dimnames(Working_mat)[[1]]
names(country_names) = country_names

sort_countries = c("Kenya", "Tanzania", "Mozambique", "Malawi", "Zambia", "Zimbabwe", "Madagascar", "Swaziland", "South Africa", "Botswana", "Angola", "Congo DRC", "Burundi", "Rwanda", "Congo", "Gabon", "Equatorial Guinea", "Cameroon", "Benin", "Togo", "Ghana", "Côte d'Ivoire", "Liberia", "Sierra Leone", "Guinea", "Gambia", "Senegal", "Mali", "Burkina Faso", "Nigeria", "Central African Republic", "Uganda", "Ethiopia", "Somalia")


cols = viridis::viridis(n = dim(Working_mat)[1], begin = 0.3, option = "D")
names(cols) <- sort_countries

col_mat = viridis::viridis(n = length(Working_mat),begin = 0.3, option = "D") 
dim(col_mat) = dim(Working_mat)
dimnames(col_mat) = dimnames(Working_mat)



#africa <- ne_countries(scale = "medium", returnclass = "sf", continent = "Africa")
#sort_df = data.frame(sort_countries, rank = seq(1,length(sort_countries),1))
