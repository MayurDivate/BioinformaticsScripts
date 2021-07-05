import pandas as pd 
import os
from sklearn.manifold import TSNE
import time 

def get_TSNE_components(inputfile, outputfile):
    print('T-SNE : unsupervised clustering')
    time_start = time.time()
    df = pd.read_csv(inputfile, sep=',', index_col=0)

    dataX = df.iloc[:,:-1]
    dataY = df.iloc[:,-1].tolist()

    tsne = TSNE(random_state=123, n_jobs=6)
    data_tsne = tsne.fit_transform(dataX)

    data_tsne = pd.DataFrame(data_tsne)
    data_tsne.index = df.index

    data_tsne['label'] = dataY
    data_tsne.to_csv(outputfile)

    print('TSNE time:',(time.time()-time_start))
    print()
    print('----- ---- --- -- Done -- --- ---- -----')

rdir = '/path/to/input/folder/',
rdir = "/Users/mayurdivate/QUT/GitHub/BioinformaticsScripts/UnsupervisedClustering"
inx = os.path.join(rdir, 'sample_data.csv')
outx = inx.replace('.csv', '_TSNE.csv')
get_TSNE_components(inx, outx)
