## Part 2, Chapter 1
# FIGURE 1: DATASET STRUCTURE
require(VennDiagram)

grid.newpage()
tiff("Figure1.tiff", width = 6, height = 6, units = 'in', res = 500)
venn.plot <- draw.pairwise.venn(area1        = 2688,
                                area2        = 1231,
                                cross.area   = 871,
                                scaled       = T,
                                category     = c("Facebook users", "Twitter users"),
                                fill         = c("darkblue", "cyan3"),
                                alpha        = 0.3,
                                lty          = "blank",
                                cex          = 1.5,
                                cat.cex      = 1.5,
                                cat.pos      = c(0, 50),
                                cat.dist     = 0.09,
                                cat.just     = list(c(1, 4), c(1, 0.5)),
                                ext.pos      = 0,
                                ext.dist     = -0.05,
                                ext.length   = 0.85,
                                ext.line.lwd = 2,
                                ext.line.lty = "dashed")
dev.off()

rm(list = ls())