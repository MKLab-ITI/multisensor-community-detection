# multisensor-community-detection

Community Detection partitions the graph’s vertices into subgroups of densely connected vertices. The implementation of the community detection task in MULTISENSOR project is presented in this script. Contrary to the traditional modularity maximization approaches for finding community structure, MULTISENSOR adopts the information-theoretic codelength minimization, known as the Infomap method [1]. MULTISENSOR uses this module for the detection of Twitter communities, given a list of desired keywords/hashtags.

[1] Rosvall, Martin, and Carl T. Bergstrom. "Maps of random walks on complex networks reveal community structure." Proceedings of the National Academy of Sciences 105, no. 4 (2008): 1118-1123.

#Description

The community_detection_v5.R file has the script, which has been developed in R, version 3.2.3 and requires the “igraph” and “rjson” libraries. The R-script runs from the command line and reads the input file of Twitter user-adjacencies. The graph of mentions is constructed and simplified to remove self-loops and isolated nodes. The Infomap community detection algorithm is employed and its result is exported as a list (communities) of lists (Twitter users) in a .json file.

# Version
1.0.0