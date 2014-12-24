best <- function(state, outcome) {
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

  ## Check that state and outcome are valid
  list_state <- unique(outcome_data$State)
  if (!state %in% list_state) stop("invalid state")
  
  list_outcome <- c('heart attack', 'heart failure', 'pneumonia')
  if (!outcome %in% list_outcome) stop("invalid outcome")
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  heart_attack_outcome_by_state <- subset(outcome_data, outcome_data$State == outcome)
  retval <- subset(heart_attack_outcome_by_state[2], heart_attack_outcome_by_state[,11] == min(heart_attack_outcome_by_state[,11], na.rm=TRUE))
  
}