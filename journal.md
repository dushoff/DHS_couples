Disclosure: Preliminary analysis based on an old data set looked fairly good. We are abandoning it before getting very detailed, because we didn't want to cheat, um, much. Code and results table will be saved before moving on.

* v0.1 Preliminary analysis scripts
* v0.2 results added https://github.com/dushoff/DHS_couples/releases/tag/v0.2

----------------------------------------------------------------------

Analysis plan:

* Get all DHS data sets from SSA with HIV results (starting from a particular time, or phase)

* Merge couples

* Select couples where
  * Both report being together >1 year
  * The female reports exactly one "union"
  * The female reports age at first intercourse between 9 and current age (strictly)
  * The female has a parse-able HIV test result
  * Other quality control as appropriate

* Calculate
  * Age difference (male - female)
  * Years active (female age - reported age at first intercourse)

* Do a histogram of age differences, and select couples from the middle 90% for further analysis (for more robust splines)

* Use naive mgcv to select a spline degree for response to 
  * age difference
  * female age

* `glmer` of HIV status against
  * splined age difference
  * splined age 
  * years sexually active
  * Country/survey/cluster (nested random effects)

Should we be concerned with potential confounders (wealth, ethnicity, education, urbanicity)? It would be nice to say we just want to look at this whole pattern at the scale of SSA.
