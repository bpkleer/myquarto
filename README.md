# Creating a local R package to build a quarto-template
With this repository, you can make a local R package. After installing the package, you can use the built-in function `create_quarto()` to create a quarto-file based on your `draft.qmd`, and it also installs (if not yet exists in the folder) the following quarto extensions:

- [jmbuhr/qrcode](https://github.com/jmbuhr/quarto-qrcode)
- [martinomagnifico/simplemenu](https://github.com/Martinomagnifico/reveal.js-simplemenu)
- [mcanouil/iconify](https://github.com/mcanouil/quarto-iconify)
- [quarto-ext/fontawesome](https://github.com/quarto-ext/fontawesome)
- [schochastics/academicons](https://github.com/schochastics/academicons)
- [sellorm/social-embeds](https://github.com/sellorm/quarto-social-embeds)

## Building the package
Download or clone the files to your local machine. Open the `.Rproj`-file and load `devtools` (install, if not installed yet). Then, use `Cmd` + `Shift` + `B` to build the package. After building, you can leave the project and start on any other path. 

## Using the package
Just open your project, where you want to build your new quarto-file based on the template. Set the working directory to that path if you are not using R-projects. 

```r
library(myquarto)

# using the in-built template
create_quarto(filename = "test")

# using a template outside the package
create_quarto(
  filename = "test",
  draft name = "/path-to-your-draft/draft.qmd"
)
```

## Changing the in-built template
You can see instructions on handling the in-built template/files [here](https://blog.bpkleer.de/).
