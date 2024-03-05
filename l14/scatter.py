import matplotlib.pyplot as plt
import numpy as np
mat=np.loadtxt("phi-psi.txt")
fig,ax = plt.subplots()

ax.set_xlabel("\u03A6 (\u00b0) ",fontsize=12)
ax.set_ylabel("\u03A8 (\u00b0)",fontsize=12)
ax.set_xlim([-180,180]) 
ax.set_ylim([-180,180]) 
s= 10
plt.scatter(mat[0:,1], mat[0:,2],s)
fig.savefig('ramachandran.png', format='png',bbox_inches='tight',dpi=300)

