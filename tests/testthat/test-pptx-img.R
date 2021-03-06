context("pptx images")
source("get_relationship.R")

png(filename = "img.png", width = 4*72, height = 4*72)
plot.new()
points(.5,.5)
dev.off()

test_that("no position no size generate no error", {
  skip_on_os("solaris")
  doc <- pptx( )
  doc <- addSlide( doc, "Title and Content" )
  doc <- try( addImage(doc, "img.png"), silent = TRUE)
  expect_is(doc, "pptx" )
})

test_that("no position but size generate no error", {
  skip_on_os("solaris")
  doc <- pptx( )
  doc <- addSlide( doc, "Title and Content" )
  doc <- try( addImage(doc, "img.png",
                       width = 4, height = 4 ), silent = TRUE)
  expect_is(doc, "pptx" )
})

test_that("position and size generate no error", {
  skip_on_os("solaris")
  doc <- pptx( )
  doc <- addSlide( doc, "Title and Content" )
  doc <- try( addImage(doc, "img.png",
                       offx = 0, offy = 0,
                       width = 4, height = 4 ), silent = TRUE)
  expect_is(doc, "pptx" )
})

test_that("position no size generate an error", {
  skip_on_os("solaris")
  doc <- pptx( )
  doc <- addSlide( doc, "Title and Content" )
  doc <- try(addImage(doc, "img.png",
                      offx = 0, offy = 0), silent = TRUE)
  expect_is(doc, "try-error" )
})



test_that("image is referenced in relationships", {
  skip_on_os("solaris")
  target_file <- tempfile(fileext = ".pptx")
  target_dir <- tempfile(fileext = "")
  doc <- pptx( )
  doc <- addSlide( doc, "Title and Content" )
  doc <- addImage(doc, "img.png")
  writeDoc(doc, target_file)

  unzip(zipfile = target_file, exdir = target_dir )
  rels <- get_relationship(file.path(target_dir, "ppt/slides/_rels/slide1.xml.rels"))
  expect_equal( sum( grepl( "image$", rels$type ) ), 1 )
})

unlink("img.png", force = TRUE)
