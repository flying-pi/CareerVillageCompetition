import pandas as pd
import os

def raw_data(root_path='/home/jovyan/work/data'):
    return {
    file: pd.read_csv(f'{root_path}/{file}')
        for file in filter(lambda  name:name.endswith('.csv'), os.listdir(root_path))
    }

