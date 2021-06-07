library(tercen)
library(dplyr)

minus <- function(df) {
  data.frame(.ri = df$.ri[1], .ci = df$.ci[1], minus = df$.y[1] - df$.y[2])
}

ctx = tercenCtx()

ctx %>% 
  select(.ri,.ci,.y) %>% 
  group_by(.ri,.ci) %>%
  do(minus(.)) %>%
  ctx$addNamespace() %>%
  ctx$save()
