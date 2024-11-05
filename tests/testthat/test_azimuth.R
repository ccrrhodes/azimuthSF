# Tests for azimuth
set.seed(42)

library(Seurat)
library(SeuratData)
library(Azimuth)


reference <- LoadData("pbmcref", "azimuth")
query <- LoadData("ifnb")
query <- NormalizeData(query, verbose = FALSE)
multilayer_query <- split(query, f = query$stim)

context("RunAzimuth()")

test_that("RunAzimuth handles multi-layer queries", {
  # split query
  annotated_query <- RunAzimuth(
    query = multilayer_query,
    reference = "pbmcref"
  )
  # integrated query
  integrated_query <- RunAzimuth(
    query = query,
    reference = "pbmcref"
  )
  expect_equal(ncol(annotated_query), ncol(integrated_query))
  expect_equal(nrow(annotated_query@meta.data), nrow(integrated_query@meta.data))
  expect_equal(ncol(annotated_query@meta.data), ncol(integrated_query@meta.data))
  expect_equal(dim(annotated_query[["ref.umap"]]), dim(integrated_query[["ref.umap"]]))
})