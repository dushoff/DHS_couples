library(dplyr)

Answers <- (Answers.couple
	%>% filter(Number.unions.m == "Once"
		& Number.unions.f == "Once"
		& Years.since.first.marriage.f > 1
		& Years.since.first.marriage.m > 1
		& Age.at.first.intercourse.f > 9 
		& Age.at.first.intercourse.f < current.age.f
		& grepl("tive", HIV.result.w)
	)
	%>% mutate(
		ageDiff = current.age.m-current.age.f
		, yearsActive = current.age.f - Age.at.first.intercourse.f
		, HIVstatus = as.factor(grepl("positive", HIV.result.w))
		, Cluster.number = as.factor(Cluster.number)
	)
	%>% filter(
		ageDiff>-3 & ageDiff<11
	)
	%>% select(HIVstatus
		, ageDiff
		, current.age.f, yearsActive
		, Country.code.and.phase, Cluster.number
	)
)

# rdsave(Answers)
