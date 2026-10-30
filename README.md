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
* `resources/`: Files related to OTTR checks (e.g., dictionary and a file of URLs to exclude/ignore from checking.). **Includes the `references.bib` file for overall citations and `motivational_refs.bib` for motivating resource specific citations.**
* `extensions/`: Files associated with the glossary and multibib extensions that support some extended styling / functionality.
* `.github/`: workflow files supporting the OTTR template automations
* `docs/`: the rendered files that GitHub pages will use -- refreshed through OTTR template automations.


### Content

For the overall content of the Open Case Study, each portion of the case study is split into individual `.qmd` files. They are included in order within the `index.qmd` file. Certain case studies will not have every component, and so we can toggle those on and off using short code and header booleans.  This is mostly for others using our case studies to teach, as they might want to have a version that only has part of the case study.  For our core team, we will likely have all components for our case studies. Below is a list of all of the sub-component `.qmd` files in checklist form. Besides the listed changes below, `index.qmd` should not need updated.

* [ ] `index.qmd`
  * [ ] Update Case Study Title
  * [ ] Update any header booleans for section inclusion or add additional short code content-hidden sections as necessary
* [ ] _main_image.qmd
  * Provides an example of including images with Quarto
  * [ ] switch out `mainplot.png` within the `img` directory to be the case study main plot.
* [ ] _ocs_frontmatter.qmd
* [ ] _cite.qmd
* [ ] _motivation.qmd
  * Provides an example of including images with Quarto (including those that you can click to open in a larger preview)
  * Provides an example of a custom definition box
  * Provides an example of citing a reference
  * Provides examples of using the glossary extension to define terms
  * Provides an example of labeling a code chunk with the filename of where that code is from
  * [ ] Verify that you have referenced each motivating reference / resource within this section
* [ ] _motivational_refs.qmd
  * [ ] Need to update the `addNoteBefore` function calls at the bottom of the file based on references in `resources/motivational_refs.bib`. Follow instructions at the top of the file to make sure citations are added to the box created by this file.
* [ ] _main_question.qmd
* [ ] _los.qmd
  * [ ] _data_science_los.qmd
  * [ ] _statistical_los.qmd
  * [ ] _biological_los.qmd
* [ ] _packages.qmd
* [ ] _context.qmd
  * Provides an example of including a video with Quarto
* [ ] _data_description.qmd
* [ ] _limitations.qmd
* [ ] _bioethics.qmd
* [ ] _data_import.qmd
* [ ] _data_exploration.qmd
* [ ] _data_wrangling.qmd
  * Provides an example of including code annotations with Quarto
* [ ] _data_visualization.qmd
* [ ] _data_analysis.qmd
  * Provides an example of using a column margin note with Quarto
  * Provides an example of a custom question opportunity box
  * Provides an example of a custom AI box
  * Provides an example of a custom Reproducibility consideration box
* [ ] _summary.qmd
* [ ] _suggested_hw.qmd
* [ ] _additional_info.qmd
* [ ] _acknowledgements.qmd
* [ ] glossary.yml: stores terms to be defined where users can click on the term and see the definition.


* [ ] **Verify**
  * [ ] Every image ....
    * [ ] has accompanying alt text (using `{fig-alt=""}`)
    * [ ] has lightbox capability enabled (using `{.lightbox}`) so that images can be opened in a larger preview
    
## Case study specific README template

Use this template to create a README specific to your case study (removing all of the content above). Confirm that you have done each task listed with a checkbox, and then delete all checkbox task lines.

### Useful Links

- [ ] replace "your-url-here" with the correct URL for your case study.

-   HTML: <https://www.opencasestudies.org/your-url-here/>
-   GitHub:
    <https://github.com/opencasestudies/your-url-here>

### Disclaimer

The purpose of the [Open Case
Studies](https://opencasestudies.github.io) project is **to demonstrate
the use of various data science methods, tools, and software in the
context of messy, real-world data**. A given case study does not cover all 
aspects of the research process, is not claiming to be the most appropriate 
way to analyze a given data set, and should not be used in the context of 
making policy or clinical decisions without external consultation from scientific 
experts or medical care professionals. In addition, due to size constraints, 
datasets used within a case study may be a subset of the original/full dataset.

### License

This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 [(CC BY-NC 4.0)](https://creativecommons.org/licenses/by-nc/4.0/deed.en) United States License unless otherwise noted.

### Citation

To cite this case study:

- [ ] Add your citation here.

### Funding

This work is funded through the National Institutes of Health, specifically the National Institute of General Medical Sciences: Grant Number 1R25GM160622.

### Acknowledgments

- [ ] Fill in reviewers for your case study (and links for their websites).

We would like to acknowledge [expert 1](website for expert 1), [expert 2](link for expert 2), [expert 3](link for expert 3), ..., and ethicist [Jodyn Platt](https://medschool.umich.edu/profile/3774/jodyn-platt) for their expert review of this case study.

We would also like to acknowledge the National Institute of General Medical Sciences for funding this work (1R25GM160622).

Icons are from [iconpacks](https://www.iconpacks.net).

Avatars are from [getavataaars](https://getavataaars.com).

### Title

- [ ] Fill in your title. 

### Prerequisites

- [ ] Fill in your prerequisities.

### Target Audience

- [ ] Fill in your target audience.

### Motivation

- [ ] Fill in short overview of motivation 

### Main Questions

- [ ] Fill in your main questions below. 

The main questions in this case study are the following:

1. ...
1. ...
1. ... 

### Learning Objectives

- [ ] Fill in your learning objectives below.
- [ ] Delete a section if you do not have any learning objectives for that section.

The learning objectives of this case study are the following:

<u>**Data Science Learning Objectives**</u>

1. ...
1. ...
1. ...

<u>**Biological/Topical Objectives:**</u>

1. ...
1. ...

<u>**Statistical Objectives:**</u>

1. ...
1. ...

### Context 

- [ ] Add an overview of your context here. 

### What are the Data?

- [ ] Add link to data source. 
- [ ] Include your variables in the table below.

In this case study, we will investigate data about samples from [this data source](data_source_URL) of ...  
The variables that we will use to answer our questions include:

Variable | Details
-------- | -------
**Variable 1** | Description
**Variable 2** | Description 
**Variable 3** | Description

### Limitations

- [ ] Give brief overview of limitations here.

### Ethical Considerations

- [ ] Give brief overview of ethical considerations here.

### Packages used in this case study

- [ ] Include your packages in the table below.

Package    | Use
---------- |-------------
[package1](package_link1) | Description 
[package2](package_link2) | Description 
[package3](package_link3) | Description 


### Data Import

- [ ] Provide brief overview of learner tasks in data import here.

### Data Exploration

- [ ] Provide brief overview of learner tasks in data exploration here.

### Data Wrangling

- [ ] Provide brief overview of learner tasks in data wrangling here.

### Data Visualization

- [ ] Provide brief overview of learner tasks in data visualization here.

### Data Analysis

- [ ] Provide brief overview of learner tasks in data analysis here.

### Summary 

- [ ] Provide brief summary of case study here. 
- [ ] Mention the summary plot here. 

### Continued Learning

- [ ] Note what types of continued learning activities are included here. 

### Other notes and resources

- [ ] Add helpful links here. 

