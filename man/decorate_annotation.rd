\name{decorate_annotation}
\alias{decorate_annotation}
\title{
Decorate the heatmap annotation
}
\description{
Decorate the heatmap annotation
}
\usage{
decorate_annotation(annotation, code, slice = NULL)}
\arguments{

  \item{annotation}{name of the annotation}
  \item{code}{code that is executed in the heatmap body}
  \item{slice}{index of row slices in the heatmap}
}
\details{
This simple function actually contructs the name of the viewport,
goes to the viewport by \code{\link[grid]{seekViewport}} and applies code
to that viewport.
}
\author{
Zuguang Gu <z.gu@dkfz.de>
}
\examples{
set.seed(123)
ha1 = HeatmapAnnotation(df = data.frame(type = rep(letters[1:2], 5)))
ha2 = rowAnnotation(point = anno_points(runif(10), which = "row"))
Heatmap(matrix(rnorm(100), 10), name = "mat", km = 2,
    top_annotation = ha1) + ha2
decorate_annotation("type", {
    grid.circle(x = unit(c(0.2, 0.4, 0.6, 0.8), "npc"), 
        gp = gpar(fill = "#FF000080"))
})
decorate_annotation("point", {
    grid.rect(gp = gpar(fill = "#FF000080"))
}, slice = 2)
}
