data <- read_csv("data/all_data.csv")

passed <- read_csv("data/passed.csv")

passed_yes <- passed %>%
  filter(passed == TRUE)

just_passed <- inner_join(data, passed_yes, by = "participant")

final_data <- just_passed %>%
  group_by(participant) %>%
  mutate(ID = cur_group_id())

size_data$participant <- NULL

size_data <- size_data %>%
  rename(participant = ID)

write_csv(size_data, "data/size_data.csv")

# This script is generic.