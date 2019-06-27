# Evaluating data-flow coverage in Spectrum-based Fault localization (SFL)
Experimental package of the study that compares the use of data-flow (DF) and control-flow (CF) in SFL.

[![License: MPL 2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3257046.svg)](https://doi.org/10.5281/zenodo.3257046)

### Subject programs
We used 163 faults from five programs in our experiments: **JFreeChart**, **Commons Lang**, **Commons Math**, and **Joda-Time** belong to the [Defects4J database](https://github.com/rjust/defects4j). We forked Defects4J version 1.1.0, which was forked in our [repository](https://github.com/saeg/defects4j/commits/master). The **jsoup's** faults come from its [repository](https://github.com/jhy/jsoup) and were selected by us. These faulty versions are available [here](https://github.com/saeg/experiments/tree/master/jaguar-2015). 

| Project | # KLOC | # Test cases | # Faults |
|:---------|---------:|---------:|---------:|
| Commons Lang | 22 | 2245 | 30 |
| Commons Math | 85 | 3602 | 43 |
| JFreeChart | 96 | 2205 | 26 |
| Joda-Time | 28 | 4130 | 26 |
| jsoup | 10 | 468 | 38 |
| Total | -- | -- | 163 |

[List of all faults](FAULTS.md)

### Results
The results of our experiment are available in this page. The [**results** folder](https://github.com/saeg/data-flow-sfl/tree/master/results) contains spreadsheets with results regarding effectiveness and efficiency of DF and CF for the ten ranking metrics implemented in Jaguar so far: DRT, Jaccard, Kulczynski2, McCon, Minus, Ochiai, Op, Tarantula, Wong3, and Zoltar.
The [**faults** folder](https://github.com/saeg/data-flow-sfl/tree/master/results/faults) contains csv files with the detailed SFL results of each fault for the ranking metrics evaluated in the experiments using data-flow and control-flow. Each file name contains the project's name, the faulty class and the number of the faulty line. The files contain the suspiciousness scores calculated by the ranking metrics, the position of faults in the SFL lists and the time spent to run all tests and create that SFL list.  
The [**stat** folder](https://github.com/saeg/data-flow-sfl/tree/master/results/stat) contains the R script (wilcox.R) that computes the statistical results comparing DF and CF. We used the **Wilcoxon signed-rank test** to compare the effectiveness of DF and CF and  **Cliff's delta** to calculate the effect size. The txt files contain the ranking positions of all faults and were used as input for the R script. The **results** file contains the statistical values obtained running the script.

## Running Jaguar

### Jaguar CLI
We used Jaguar CLI to gather both data-flow (DF) and control-flow (CF) spectra and to create suspiciousness lists.
The Jaguar's version used in the experiment is available here in its [Github page](https://github.com/saeg/jaguar/releases/tag/jaguar-0.0.6-4f9d6f0) or as a [jar file](https://github.com/saeg/jaguar/releases/download/jaguar-0.0.6-4f9d6f0/br.usp.each.saeg.jaguar.core-0.0.6-SNAPSHOT-jar-with-dependencies.jar). 
Jaguar was developed and the experiments were performed using Java 7.

#### Defects4J setup
Steps to install Defects4J and download a specific version you want to run (more details can be found on [Defects4J repository](https://github.com/rjust/defects4j)):

```shell
# Install
git clone https://github.com/rjust/defects4j
cd defects4j
./init.sh
export PATH=$PATH:`pwd`/framework/bin

# Create experiments folder
cd ..
mkdir experiments
cd experiments

# Download Commons Lang buggy version 1
defects4j checkout -p Lang -v 1b -w ./lang_1_buggy

# Run tests
cd ./lang_1_buggy
defects4j compile
defects4j test
```

#### jsoup setup
Each available version of jsoup can be accessed in our repository using the commit ID. See the **SAEG-INSTALL** files that we included inside each version to see the commit IDs and details about the fault, such as faulty class, faulty line, bug description and bug issue.

### SFL list analyzer (Podium)
We developed a tool called **podium** to analyze the SFL lists created by Jaguar and to compute the effectiveness of DF and CF for all programs. Podium is available [here](https://github.com/saeg/podium).

### Help
Feel free to ask us in case of doubts.

### Citation
```
@article{
	author={Henrique L. Ribeiro and Higor A. de Souza and Roberto P. A. de Araujo and Marcos L. Chaim and Fabio Kon},
	title={Evaluating data-flow coverage in spectrum-based fault localization},
	booktitle = {Proceedings of the 13th ACM/IEEE International Symposium on Empirical Software Engineering and Measurement},
	series = {ESEM '19},
	year = {2019},
	pages = {}
}
```
