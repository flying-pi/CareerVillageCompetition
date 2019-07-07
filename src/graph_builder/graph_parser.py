def parse_graph(df, key_column, value_column):
    source_col = 'source'
    destination_col = 'destination'
    connections = (
        df.rename(columns={key_column: source_col}).set_index(value_column).join(
            df.rename(columns={key_column: destination_col}).set_index(value_column),
        )
    )
    connections = connections[connections[source_col]!=connections[destination_col]]
    connections = connections.reset_index()[[source_col, destination_col]]
    connections = connections.groupby([source_col, destination_col]).agg('size')
    connection_dict = connections.to_dict()
    for (source, destination), w in connection_dict.items():
        print(source, destination, w)
    import pydevd_pycharm
    pydevd_pycharm.settrace('host.docker.internal', port=3420, stdoutToServer=True, stderrToServer=True)
    print(df)


connections = df.rename(columns={key_column: 'source'}).set_index(value_column).join(
    df.rename(columns={key_column: 'desrination'}).set_index(value_column))
