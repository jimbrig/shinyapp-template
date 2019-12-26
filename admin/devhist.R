
#  ------------------------------------------------------------------------
#
# Title : Development History for ShinyApp Template Repo
#    By : Jimmy Briggs
#  Date : 2019-12-26
#
#  ------------------------------------------------------------------------

# packages
if (!require(pacman)) install.packages("pacman")
pacman::p_load(
  fs,
  devtools,
  usethis,
  purrr,
  magrittr
  # shiny,
  # shinydashboard
)

# directories
c(
  "admin",
  "shiny-app",
  "shiny-app/ui",
  "shiny-app/server",
  "shiny-app/R",
  "shiny-app/data",
  "shiny-app/www",
  "shiny-app/www/images",
  "data-prep",
  "data-prep/data-raw",
  "data-prep/data",
  "data-prep/scripts"
) %>%
  purrr::walk(fs::dir_create, recurse = TRUE)

# files
c(
  "run-app.R",
  "deploy-app.R",
  "shiny-app/config.yml",
  "shiny-app/ui.R",
  "shiny-app/server.R",
  "shiny-app/global.R",
  "shiny-app/R/utils.R",
  "shiny-app/R/ui_header.R",
  "shiny-app/R/ui_sidebar.R",
  "shiny-app/R/ui_body.R",
  "shiny-app/ui/ui_tab_one.R",
  "shiny-app/ui/ui_tab_two.R",
  "shiny-app/server/server_tab_one.R",
  "shiny-app/server/server_tab_two.R",
  "shiny-app/www/custom.css",
  "shiny-app/www/custom.js",
  "data-prep/scripts/1-setup.R",
  "data-prep/scripts/2-process.R",
  "data-prep/scripts/3-output.R",
  "data-prep/run-prep.R"
) %>%
  purrr::walk(fs::file_create)

# readme
usethis::use_readme_rmd()

# git ignores
c(
  "data-prep/data-raw",
  "data-prep/data",
  "shiny-app/data"
) %>%
  purrr::walk(function(x) usethis::use_git_ignore(
    ignores = c("*", "!.gitignore"), directory = x)
  )
