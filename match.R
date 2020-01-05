# Match up data
	m = match( paste(fam[,1],fam[,2]) , paste(pheno[,1],pheno[,2]) )
	m.keep = !is.na(m)
	fam = fam[m.keep,]
	m = m[m.keep]
	pheno = pheno[m,]
