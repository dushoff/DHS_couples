library(ordinal)
library(splines)

modAns <- model.frame(
	HIVstatus ~
		ageDiff + current.age.f
		+ yearsActive
		+ Country.code.and.phase + Cluster.number
	, data=Answers
)

mod <- clmm(
	HIVstatus ~
		ns(ageDiff, 3)  + ns(current.age.f, 3)
		+ yearsActive
		+ (1 | Country.code.and.phase)
		+ (1 | Country.code.and.phase:Cluster.number)
	, data=modAns
)

print(summary(mod))

drop1(mod, test="Chisq")
