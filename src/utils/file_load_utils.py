import os

import pandas as pd

import const


def raw_data(root_path=const.DATA_DIR):
    return {
        file: pd.read_csv(f'{root_path}/{file}')
        for file in filter(lambda name: name.endswith('.csv'), os.listdir(root_path))
    }
