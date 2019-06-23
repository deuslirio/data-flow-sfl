# Evaluating data-flow coverage in Spectrum-based Fault localization (SFL)
Experimental package of the experiment comparing the use of data-flow and control-flow in SFL.

### Jaguar CLI
We used Jaguar CLI to gather both data-flow (DF) and control-flow (CF) spectra and to create suspiciousness lists.
The Jaguar's version used in the experiment is available [here](https://github.com/saeg/).

#### Setting a server to receive user logs 
When a participant finishes the experiment and clicks on the stop button, the log data is sent to a server. The Jaguar jar files available here were set to send to our server. 
To use Jaguar, you'll need to clone the [project](https://github.com/saeg/jaguar) change the **ScpSend** class to set your server, user and folder, and create a new jar.

### Subject programs
We used 163 faults from five programs in our experiments: **JFreeChart**, **Commons Lang**, **Commons Math**, and **Joda-Time** were obtained from the [Defects4J database](https://github.com/rjust/defects4j). We used Defects4J version 1.1.0, which was forked in our [repository](https://github.com/saeg/defects4j/commits/master). The **jsoup's** faults were obtained by us from its [repository](https://github.com/jhy/jsoup/) and are available [here](https://github.com/saeg/experiments/tree/master/jaguar-2015). 

| Project | # KLOC | # Test cases | # Faults |
|---------|---------|---------|---------:|
| Commons Lang | 22 | 2245 | 30 |
| Commons Math | 85 | 3602 | 43 |
| JFreeChart | 96 | 2205 | 26 |
| Joda-Time | 28 | 4130 | 26 |
| jsoup | 10 | 468 | 38 |
| Total | -- | -- | 163 |

[List of all defects](DEFECTS.md)

#### Defects4J
Steps to install defects4J and download a specific version (more details can be found on [Defects4J repository](https://github.com/rjust/defects4j)):

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

### Suspiciousness lists
There are ten ranking metrics available in Jaguar: DRT, Jaccard, Kulczynski2, McCon, Minus, Ochiai, Op, Tarantula, Wong3, and Zoltar.
You can choose a ranking metric to calculate suspicious program elements bu running the option . The SFL lists that we created are available [here](https://github.com/saeg/user-study-sfl/tree/master/susp-lists). The lists also contain the time spent to run the programs and create the SFL lists, which we used to analyze the efficiency of DF and CF.

### Result extractor
We created a script to analyze the SFL lists and compute the effectiveness of DF and CF for all programs. The extractor is available [here]().

### Results
The results of our experiment are available [here]().

### Instructions
Install Java 7, Docker, Ansible, download Jaguar, put the subject program in folder, run the following commands to gather DF and CF spectra. After that, run the analyzer to compute the results and create the output.

### Java version
Jaguar was developed and the experiments were performed using Java 7.

### Virtual machine / Container
We created a [container](https://) that contains all the necessary resources to run the experiment. You'll just need to run the following command: 

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
