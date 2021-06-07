library(tercen)
library(dplyr)

# Set appropriate options
#options("tercen.serviceUri"="http://tercen:5400/api/v1/")
#options("tercen.workflowId"= "4133245f38c1411c543ef25ea3020c41")
#options("tercen.stepId"= "2b6d9fbf-25e4-4302-94eb-b9562a066aa5")
#options("tercen.username"= "admin")
#options("tercen.password"= "admin")

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
