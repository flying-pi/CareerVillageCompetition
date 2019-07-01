##### This file contains list of idea 

* Try to use some precleaned word embedding to improve embedding quality of the existing dataset.
* Build a recurrent network, which will be learned by the siamese network to catch similarity in the data.
* Try to build graph (for build negative sampling for siamese network by). 
For each type of the graph estimate how many teachers will leave without any information. Estimate Graph sparse. Longest short path
    
    ###### graph types :
    * vertex - teachers, age - placed in same mailing list 
    * vertex - teachers, age - answers on same question
    * vertex - questions, age - placed in one mailing list 
    * vertex - questions, age - answered by same teachers 
    * vertex - questions, age - same tag 
    