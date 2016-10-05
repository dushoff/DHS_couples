library(tidyr)
library(lme4)
library(ggplot2)

vp <- varpred(mod, "ageDiff", modAns)
vpg <- (vp
	%>% gather(q, v, fit:upr)
)

print(
	ggplot(vpg, aes(x=ageDiff, y=v, color=q))
	+ geom_line()
)


