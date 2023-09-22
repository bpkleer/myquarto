# Template-Package to create quarto-presentation in folder
# Author: Philipp Kleer
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

# Main function (and so far only function)
create_quarto <- function(
    filename = NULL,
    draftname = "_extensions/myquarto/draft.qmd",
    ext_name = "myquarto"
    ) {

  if (is.null(filename)) {
    stop("You must provide a valid filename")
  }

  out_dir <- getwd()

  # check for available extensions
  stopifnot("Extension not in package" = ext_name %in% c("myquarto"))

  # check for existing _extensions directory
  if(!file.exists("_extensions")) dir.create("_extensions")
  message("Created '_extensions' folder")

  # Create folder for recursive copying into ahead of time
  if(!file.exists(paste0("_extensions/", ext_name))) dir.create(paste0("_extensions/", ext_name))
  message("Created '_extensions/myquarto' folder")

  # copy from internals
  # copy my template
  file.copy(
    from = system.file(paste0("extdata/_extensions/", ext_name), package = "myquarto"),
    to = paste0("_extensions/"),
    overwrite = TRUE,
    recursive = TRUE,
    copy.mode = TRUE
  )

  # Create folder for recursive copying into ahead of time
  if (draftname == "_extensions/myquarto/draft.qmd") {
    if (!dir.exists(paste0("assets/"))) dir.create(paste0("assets/"))
    message("Created 'assets' folder")

    file.copy("_extensions/myquarto/assets/", "./", recursive = TRUE)
  }

  # create new qmd report based on skeleton
  readLines(draftname) |>
    writeLines(
      text = _,
      con = paste0(filename, ".qmd", collapse = "")
    )

  # open the new file in the editor
  # file.edit(paste0(filename, ".qmd", collapse = ""))

  if (!dir.exists("./_extensions/jmbuhr/qrcode")) {
    install <- rstudioapi::terminalExecute("quarto install extension jmbuhr/quarto-qrcode")

    while (is.null(rstudioapi::terminalExitCode(install))) {
      Sys.sleep(2)
    }

    rstudioapi::terminalKill(install)

    message("Extension 'qrcode' has been created.")
  } else {
    message("Extension 'qrcode' already exists.")
  }

  if (!dir.exists("./_extensions/martinomagnifico/simplemenu")) {
    install2 <- rstudioapi::terminalExecute("quarto add martinomagnifico/quarto-simplemenu")

    while (is.null(rstudioapi::terminalExitCode(install2))) {
      Sys.sleep(2)
    }

    rstudioapi::terminalKill(install2)

    message("Extension 'simplemenu' has been created.")
  } else {
    message("Extension 'simplemenu' already exists.")
  }

  if (!dir.exists("./_extensions/mcanouil/iconify")) {

    install3 <- rstudioapi::terminalExecute("quarto add mcanouil/quarto-iconify")

    while (is.null(rstudioapi::terminalExitCode(install3))) {
      Sys.sleep(2)
    }

    rstudioapi::terminalKill(install3)

    message("Extension 'iconify' has been created.")
  } else {
    message("Extension 'iconify' already exists.")
  }

  if (!dir.exists("./_extensions/quarto-ext/fontawesome")) {

    install4 <- rstudioapi::terminalExecute("quarto add quarto-ext/fontawesome")

    while (is.null(rstudioapi::terminalExitCode(install4))) {
      Sys.sleep(2)
    }

    rstudioapi::terminalKill(install4)

    message("Extension 'fontawesome' has been created.")
  } else {
    message("Extension 'fontawesome' already exists.")
  }

  if (!dir.exists("./_extensions/schochastics/academicons")) {
    install5 <- rstudioapi::terminalExecute("quarto install extension schochastics/academicons")

  while (is.null(rstudioapi::terminalExitCode(install5))) {
    Sys.sleep(2)
  }

  rstudioapi::terminalKill(install5)

  message("Extension 'academicons' has been created.")
  } else {
    message("Extension 'academicons' already exists.")
  }

  if (!dir.exists("./_extensions/sellorm/social-embeds")) {
  install6 <- rstudioapi::terminalExecute("quarto install extension sellorm/quarto-social-embeds")

  while (is.null(rstudioapi::terminalExitCode(install6))) {
    Sys.sleep(2)
  }

  rstudioapi::terminalKill(install6)

  message("Extension 'social-embeds' has been created.")
  } else {
    message("Extension 'social-embeds' already exists.")
  }
}
