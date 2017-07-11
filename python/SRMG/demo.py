import numpy as np
import srmg.core.RiemannianLeft as RL
import srmg.core.RiemannianRight as RR
import srmg.core.ExponentialBarycenter as EB

N = 100
a = 1

##### Create Example Random SE3 Points #####
tabf = np.zeros([N,6])      # tabf: Nx6 vector of SE3 points
tabw = np.ones([N]) / N     # tabw: N vector of SE3 point weightage

for i in range(0,N):
    tabf[i,:] = RL.unifRnd()

##### Left Frechet Mean #####
print RL.frechetL(a,tabf,tabw)

##### Right Frechet Mean #####
print RR.frechetR(a,tabf,tabw)

##### Exponential Barycenter #####
print EB.expBar(tabf,tabw)

