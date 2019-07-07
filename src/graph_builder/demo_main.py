import pandas as pd

from graph_builder.graph_parser import parse_graph


def main():
    fake_data = {
        'key': ['a', 'a', 'a', 'b', 'a', 'c', 'b'],
        'value': [1, 1, 2, 1, 2, 1, 2]
    }
    demo_df = pd.DataFrame(data=fake_data)
    parse_graph(demo_df, 'key', 'value')


if __name__ == '__main__':
    main()
