import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({ giphys }) => {
    if (giphys.length) debugger
    return (
        <ul>
        {
            giphys.map((p, i) =>
                <GiphysIndexItem key={i}
                                 src={p.url} />)
        }
        </ul>
    );
};

export default GiphysIndex;
