# Structured Doubly Stochastic Graph-based Clustering （SDSGC）
This is a Matlab implementation of  paper "Multi-order Graph based Clustering Via Dynamical Low Rank Tensor Approximation", which is accepted by Neurocomputing in 2025. 

# Contributions
In this paper, an advanced graph based clustering model that unifies the process of ***adaptive graph selection, dynamic low rank tensor approximation and doubly stochastic graph learning***. Our proposed model achieves high clustering accuracy that far surpasses previous works within acceptable time increments. In particular, for the JAFFE dataset, it obtains the ground truth.



# Usage of this code

## To reproduce  the results
Run "test_MCDLT.m", the clustering results and visual graph will be reported.

## For hyperparamters
You should notice the hyperparameters. There are in total four hyperparameters for our model. $o$ is the maximum order of graph. $Z$ is the retained number of graph after adaptive selection. $alpha$  and $beta$ are two hyperparameters for low-rank tensor learning.

The value of $o$ and $Z$ is easy to set. In order to ensure the effectiveness of graph selection, we only need to set $o$ is relatively large and $Z$ is relatively small. For U+03B1  and U+03B2, we found when their values in [10,100,1000], the best clusteing performance is always achieved.


# For more  works
If you are interested at my works, you can get more papers and codes at my [Homepage](https://nianwang-hjjgcdx.github.io/).

# Citation
If you think our work is helpful,  considering to give a star for this repository. Thanks!
If you use our code or nois data sets, please kindly cite our paper by
```
@ARTICLE{MCDLT,
  author={Wang, Nian and Cui, Zhigao and Li, Aihua and Lu, Yihang and Wang, Rong and Nie, Feiping},
  journal={Neurocomputing}, 
  title={Multi-order Graph based Clustering Via Dynamical Low Rank Tensor Approximation}, 
  year={2025},
  volume={},
  number={},
  pages={1-14}}
```
