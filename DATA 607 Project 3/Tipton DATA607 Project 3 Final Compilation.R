rm(list = ls())
load("num_resumes_per_skill.Rdata")
load("ed.skill.Rdata")
load("job_skills_sum.Rdata")

library(ggplot2)
library(tidyverse)

ggplot(num_resumes_per_skill, aes(x = reorder(Skill, Percent.resumes.across.overall.set), 
                                  y = Percent.resumes.across.overall.set, fill = Soft.or.technical))  + 
  geom_bar(stat = 'identity', position = 'dodge') +
  coord_flip() +
  labs(title = "Job Seeker Resume Skills", x = "Skill", y = "Percentage of Resumes with Skill") + 
  scale_fill_discrete(name = "Skill Type")

colnames(job.skills.sum)[3] <- "Job.Posting.Percent"
colnames(num_resumes_per_skill)[3] <- "Resume.Percent"
colnames(ed.skill)[3] <- "Education.Percent"

x <- full_join(num_resumes_per_skill, ed.skill)
consolidated <- full_join(x, job.skills.sum)
arrange(consolidated, Skill)

consolidated[is.na(consolidated)] <- 0

consolidated <- mutate(consolidated, Overall.Percent = ((Resume.Percent + Education.Percent + Job.Posting.Percent)/3))
View(consolidated)

ggplot(consolidated, aes(x = reorder(Skill, Overall.Percent), 
                                  y = Overall.Percent, fill = Soft.or.technical))  + 
  geom_bar(stat = 'identity', position = 'dodge') +
  coord_flip() +
  labs(title = "Top Data Science Skills Overall", x = "Skill", y = "Average Overall Percentage of Results with Skill") + 
  scale_fill_discrete(name = "Skill Type")

save(consolidated, file="consolidated_skill_percentages.Rdata")
