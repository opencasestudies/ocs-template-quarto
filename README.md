# Bio-OCS Quarto Template

This is a template for creating websites from qmd files hosted on GitHub with three helpful automations following a pull request to the repository:

- Spelling check
- Broken link check
- Website rendering.

This is all supported by the OTTR Template, specifically the [OTTR Quarto Web](https://github.com/ottrproject/OTTR_Quarto_Website) version.

- Check for spelling errors more intensively than RStudio and allow you to add words to the dictionary
- Check for broken links - you will be warned about broken links
- Automatic rendering of the website for previewing before merges
- Automatic rendering of the website upon merging to main
- Docker images that can be customized.

This specific template sets up the style and content template for Biomedical Open Case Studies (Bio-OCS).

## Repository Structure + Checklist for files to update when using the template

### Style and Configuration

* _quarto.yml -- Configurations for how the rendered website will look.
  * [ ] Update the title on line 6
  * [ ] Replace the Google analytics tracking ID ("G-XXXXXXXXXX") with the appropriate Bio_OCS case study specific tracking ID on line 17
  * [ ] Update the GitHub Repository link to point to the specific open case studies repository instead of the template
    * [ ] line 11
    * [ ] line 28

* [ ] Verify that within the content `.qmd` files, `***` is used for spacing lines under Level 1 (`#`) and Level 2 (`##`) section headers only.
* [ ] Verify that within the content `.qmd` files, `***` is used for spacing lines at the end of sections that start with a Level 1 (`#`) section header before the next section with a Level 1 (`#`) section header (.e.g., at the end of the `_data_import.qmd` file. 

The rest of these files will largely not need updated though a brief description of what each contains is provided.

* `_bibliography.qmd` -- automatically adds the references that are included in `resources/references.bib` and referenced within the content `.qmd` files.
* `_glossary_table.qmd` -- automatically builds the glossary table for **all** terms that are included in the `glossary.yml` file whether they are defined with the `{{< glossary term >}}` syntax within the content or not.
* styles.css -- Defines html elements
* `auto-add-ai-disclaimer.lua` -- this is a lua filter that during rendering automatically adds an AI use disclaimer (defined within the lua filter) as a column margin note next to AI boxes (the element `.ai_box` element defined `styles.css`)
* _brand.yml -- Logo and favicon definition
* config_automation.yml	-- Configurations for the OTTR Template automations. Update this file to toggle spelling or url check as well as minimum errors allowed for those checks or to update the docker image.

### Directories

* `data/`: Raw, imported, and wrangled datasets. `raw/pm25_data.csv`, `imported/pm25_data_imported.rda`, and `wrangled_data.csv` are template files that can be removed or overwritten by case study repositories.
* `assets/`: Template images such as the logo or icons.
* `img/`: This is where images should go for the case study background, motivation, etc.
  - [ ] Replace the `mainplot.png` from the template with your main plot
  - [ ] Add any additional case study specific (non-template) images in this directory
* `resources/`: Files related to OTTR checks (e.g., dictionary and a file of URLs to exclude/ignore from checking.). **Includes the `references.bib` file for overall citations, `motivational_refs.bib` for motivating resource specific citations, and `glossary.yml` for a list of glossary terms.**
* `extensions/`: Files associated with the glossary and multibib extensions that support some extended styling / functionality.
* `.github/`: workflow files supporting the OTTR template automations
* `docs/`: the rendered files that GitHub pages will use -- refreshed through OTTR template automations.


### Content

For the overall content of the Open Case Study, each portion of the case study is split into individual `.qmd` files. They are included in order within the `index.qmd` file. Certain case studies will not have every component, and so we can toggle those on and off using short code and header booleans.  This is mostly for others using our case studies to teach, as they might want to have a version that only has part of the case study.  For our core team, we will likely have all components for our case studies. Below is a list of all of the sub-component `.qmd` files in checklist form. Besides the listed changes below, `index.qmd` should not need updated.

All sub-compound .qmd files are in sub-folders within the content folder. 

* [ ] `index.qmd`
  * [ ] Update Case Study Title
  * [ ] Update any header booleans for section inclusion or add additional short code content-hidden sections as necessary
* contents
  * background
    * [ ] _01_main_image.qmd
      * Provides an example of including images with Quarto
      * [ ] switch out `mainplot.png` within the `img` directory to be the case study main plot.
    * [ ] _02_ocs_frontmatter.qmd
    * [ ] _02a_cite.qmd
    * [ ] _03_motivation.qmd
      * Provides an example of including images with Quarto (including those that you can click to open in a larger preview)
      * Provides an example of a custom definition box
      * Provides an example of citing a reference
      * Provides examples of using the glossary extension to define terms
      * Provides an example of labeling a code chunk with the filename of where that code is from
      * [ ] Verify that you have referenced each motivating reference / resource within this section
    * [ ] _03b_motivational_refs.qmd
      * [ ] Need to update the `addNoteBefore` function calls at the bottom of the file based on references in `resources/motivational_refs.bib`. Follow instructions at the top of the file to make sure citations are added to the box created by this file.
    * [ ] _04_main_question.qmd
    * [ ] _05_los.qmd
      * [ ] _05a_data_science_los.qmd
      * [ ] _05b_statistical_los.qmd
      * [ ] _05c_biological_los.qmd
    * [ ] _06_context.qmd
      * Provides an example of including a video with Quarto
  * setup_descriptions
    * [ ] _07_data_description.qmd
    * [ ] _08_limitations.qmd
    * [ ] _09_bioethics.qmd
    * [ ] _10_packages.qmd
  * data_handling
    * [ ] _11_data_import.qmd
    * [ ] _12_data_exploration.qmd
    * [ ] _13_data_wrangling.qmd
      * Provides an example of including code annotations with Quarto
    * [ ] _14_data_visualization.qmd
    * [ ] _15_data_analysis.qmd
      * Provides an example of using a column margin note with Quarto
      * Provides an example of a custom question opportunity box
      * Provides an example of a custom AI box
      * Provides an example of a custom Reproducibility consideration box
  * summary_additional_info 
    * [ ] _16_summary.qmd
    * [ ] _17_main_qs_answers_table.qmd
    * [ ] _18_suggested_hw.qmd
    * [ ] _19_additional_info.qmd
    * [ ] _19b_glossary_table.qmd
    * [ ] _20_bibliography.qmd
    * [ ] _21acknowledgements.qmd
* [ ] glossary.yml: stores terms to be defined where users can click on the term and see the definition.


* [ ] **Verify**
  * [ ] Every image ....
    * [ ] has accompanying alt text (using `{fig-alt=""}`)
    * [ ] has lightbox capability enabled (using `{.lightbox}`) so that images can be opened in a larger preview
