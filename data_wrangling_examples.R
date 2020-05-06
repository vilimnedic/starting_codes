####
####
#### Causal inference: Computer lab 
####
####
mu_t <- data %>% 
  filter(swang1 == 1) %>% 
  select(-id) %>% 
  summarise_all(mean)

mu_t_df <- as.data.frame(t(mu_t))
mu_t_df <- rownames_to_column(mu_t_df)
colnames(mu_t_df) <- c("Variables", "Mean")

mu_c <- data %>% 
  filter(swang1 == 0) %>% 
  select(-id) %>% 
  summarise_all(mean)

mu_c_df <- as.data.frame(t(mu_c))
mu_c_df <- rownames_to_column(mu_c_df)
colnames(mu_c_df) <- c("Variables", "Mean")



sd_t <- data %>% 
  filter(swang1 == 1) %>% 
  select(-id) %>% 
  summarise_all(sd)

sd_t_df <- as.data.frame(t(sd_t))
sd_t_df <- rownames_to_column(sd_t_df)
colnames(sd_t_df) <- c("Variables", "sd")

sd_c <- data %>% 
  filter(swang1 == 0) %>% 
  select(-id) %>% 
  summarise_all(sd)

sd_c_df <- as.data.frame(t(sd_c))
sd_c_df <- rownames_to_column(sd_c_df)
colnames(sd_c_df) <- c("Variables", "sd")

table_131 <- bind_cols(list(mu_c_df, sd_c_df, mu_t_df, sd_t_df))
table_131 <- table_131[, -c(3, 5, 7)]
colnames(table_131) <- c("Variables", "Mean", "(S.D.)", "Mean", "(S.D.)")
table_131[, 2:5] <- round(table_131[, 2:5], 2) 
table_131[1, 1:5] <- c("Treatment", 0, 0, 1, 1)
View(table_131)
