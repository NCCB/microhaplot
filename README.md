# haplot   

`haplot` generates visual summaries of microhaplotypes found in short read alignments.

This software exists as a an R package `haplot` that includes within it the code to set up and 
establish an Rstudio/Shiny server to visualize and manipulate the data.  There are two key steps in 
the `haplot` worflow:

1. The first step is to summarize alignment and variation data into a single data frame that is 
easily operated upon.  This is done using the function `haplot::runHaplot`.  You must supply a 
VCF file that includes variants that you are interested in extracting, and as many SAM files 
(one for each individual) that you want to extract read informtion from at each of the variants. 
The functio `haplot::runHaplot` makes a call
to PERL to parse the CIGAR strings in the SAM files to extract the variant information at each read
and store this information inta a data frame which gets saved with the installed Shiny app (see below)
for later use.  Depending on the size of the data set, this can take a few minutes.  

2. The second step is to run the haPLOType Shiny app to visualize the sequence information, call genotypes using
simple read-depth based filtering criteria, and curate the loci. haPLOType is is suitable for carrying quick assesement
and quality control of haplotype generated from library runs. Plot summaries include read depth, fraction of callable haplotype, Hardy-Weinberg
equilibrium plots, and more. 


See the **Example Data** section to learn about how to run each of these steps on the example data that are provided
with the package.  

   

### Installation and Quick Start

You can either clone the repository and build the `haplot` package yourself, or, more easily, you can
install it using  [devtools](https://github.com/hadley/devtools). You can get `devtools` by `install.packages("devtools")`.

Once you have `devtools` available in R, you can get `haplot` this way:
```r
# sudo R
devtools::install_github("eriqande/haplot", ref = "erics-haplot-updates")
```
That is currently set to get it from Eric Anderson's updated fork.  Everything will eventually get merged
in.

Once you have installed the `haplot` R package with devtools there you need to use the `haplot::mvHaplotype`
to establish the haPLOType Shiny App in a convenient location on your system. The following line
createst the directory `Shiny` in my home directory and then within that it creates the 
directory `haPLOType` and fills it with the Shiny app as well as the example data that go 
along with that.  

```r
haplot::mvHaplotype("~/Shiny") # provide a directory path to host the haPLOType app
```

Now, having done that, we can launch haPLOType on the example data:
```r
app.path <- "~/Shiny/haPLOType"
runHaplotype(app.path)
```

### Quick Guide to use Haplot

To upload your alignment files to shiny App `haPLOType`, you will need to generate a tab-separate **label** file with 3 info columns: path to SAM file name, individual ID, and group label (in this particular order). 

If you do not want assign any group label for the individuals, you can just leave it as "NA". 

NOTE: It is recommended that you have all of the SAM files under one directory to make this labeling task easier.

An example of the `label` file:
```txt
satro_flashed_s1_aln.sam        s1      black
satro_flashed_s2_aln.sam        s2      black
satro_flashed_s3_aln.sam        s3      black
satro_flashed_s4_aln.sam        s4      black
satro_flashed_s5_aln.sam        s5      copper
``` 
  
  
Now you can proceed with running `runHaplot`. You will need to provide:

 * a label 
 * path to the directory with all SAM files 
 * path to the `label` file you just created
 * path to the VCF file  
  
  
```R
library(haplot)

# ---- edit ---------
run.label <- "example 1"
sam.path <- "data/satro_sample"
label.path <- "data/satro_sample/sample_label.txt"
vcf.path <- "data/satro_sample/sebastes.vcf"
app.path <- "~/bin/haPLOType" 
# -------------------------

haplo.read.tbl <- runHaplot(run.label = run.label, 
          sam.path=sam.path,
          label.path=label.path,
          vcf.path=vcf.path,
          app.path=app.path)

runHaplotype(app.path)
```


### Suggestions
- SAM files: For pair-ended experiment, both directional reads should be flashed into one.

- VCF: `SrMicroHap` might have trouble infering individual's true haplotype if no reads are aligned to the variant site.

