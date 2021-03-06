test_that("sample_mainland runs silent and produces correct output complete
          sampling", {
  mainland_clade <- create_test_mainland_clade(mainland_scenario = 3)

  expect_silent(sampled_mainland <- sample_mainland(
    total_time = 1,
    mainland_clade = mainland_clade,
    mainland_sample_prob = 1)
  )
  expect_equal(mainland_clade, sampled_mainland)
})

test_that("sample_mainland runs silent and produces correct output incomplete
          sampling", {
  set.seed(
    1,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )

  mainland_clade <- create_test_mainland_clade(mainland_scenario = 3)
  expect_silent(sampled_mainland <- sample_mainland(
    total_time = 1,
    mainland_clade = mainland_clade,
    mainland_sample_prob = 0.5)
  )
  new_mainland <- data.frame(
    spec_id = c(2, 27, 28),
    main_anc_id = c(2, 2, 2),
    spec_type = c("E", "NS", "NS"),
    branch_code = c("A", "AA", "AB"),
    branch_t = c(NA, 0.779042070209266, 0.779042070209266),
    spec_origin_t = c(0, 0.779042070209266, 0.779042070209266),
    spec_ex_t = c(0.779042070209266, 0.99999, 0.99999))

  expect_equal(new_mainland, sampled_mainland)
})
