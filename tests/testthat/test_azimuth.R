# Tests for azimuth
set.seed(42)

# set up test objects 
reference <- LoadData("pbmcref", "azimuth")
reference <- NormalizeData(reference, verbose = FALSE)
reference <- FindVariableFeatures(, verbose = FALSE)
reference <- ScaleData(reference, verbose = FALSE)
reference <- RunPCA(reference, verbose = FALSE)

query <- LoadData("ifnb")
query <- NormalizeData(query, verbose = FALSE)
multilayer_query <- split(query, f = query$stim)

context("RunAzimuth()")

test_that("RunAzimuth work", {
  anchors <- FindTransferAnchors(reference = reference, query = query, k.filter = 50)
  co <- anchors@object.list[[1]]
  # expect_equal(dim(co), c(100, 160))
  # expect_equal(Reductions(co), c("pcaproject", "pcaproject.l2"))
  # expect_equal(GetAssayData(co[["RNA"]], layer ="data")[1, 3], 0)
  # expect_equal(GetAssayData(co[["RNA"]], layer = "counts")[1, 3], 0)
  # expect_equal(dim(co[['pcaproject']]), c(160, 30))
  # expect_equal(Embeddings(co[['pcaproject']])[1, 1], 0.4840944592, tolerance = 1e-7)
  # expect_equal(Loadings(co[['pcaproject']], projected = T)[1, 1], 0.2103563963, tolerance = 1e-7)
  # expect_equal(dim(co[['pcaproject.l2']]), c(160, 30))
  # expect_equal(Embeddings(co[['pcaproject.l2']])[1, 1], 0.05175486778, tolerance = 1e-7)
  # expect_equal(Loadings(co[['pcaproject.l2']], projected = T)[1, 1], 0.2103563963, tolerance = 1e-7)
  # ref.cells <- paste0(Cells(ref), "_reference")
  # query.cells <- paste0(Cells(query), "_query")
  # expect_equal(anchors@reference.cells, ref.cells)
  # expect_equal(anchors@query.cells, query.cells)
  # expect_equal(anchors@reference.objects, logical())
  # anchor.mat <- anchors@anchors
  # expect_equal(dim(anchor.mat), c(128, 3))
  # expect_equal(as.vector(anchor.mat[1, ]), c(5, 5, 0.08361970218), tolerance = 1e-7)
  # expect_equal(max(anchor.mat[, 2]), 80)
  # expect_null(anchors@offsets)
  # expect_equal(length(anchors@anchor.features), 100)
  # expect_equal(anchors@anchor.features[1], "PPBP")
  expect_equal(anchors@neighbors, list())
})