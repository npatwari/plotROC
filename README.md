# plotROC
Matlab code for computing and plotting a receiver operating characteristic (ROC) curve

A binary detector works on two hypotheses:
 * H_0: The null hypothesis, that is, the normal assumption about the system that generated the data.
 * H_1: The alternate hypothesis, that is, an alternate system that may have generated the data.  We use an "alarm" if H_1 is decided to be true.

In my code, the detector is assumed to be a threshold test which decides H_1 if the value is **above** the threshold, or H_1 if it is below.  

I assume that your simulation or experiment collects data (scalar sufficient statistic) in the two cases, some data from when H_0 is true, and some data from when H_1 is true.

I do not assume that the number of data points in H_1 and in H_0 is the same. 

My computeROC(x_0, x_1) has inputs x_0 and x_1, the data collected when H_0 is true and when H_1 is true, respectively. 

